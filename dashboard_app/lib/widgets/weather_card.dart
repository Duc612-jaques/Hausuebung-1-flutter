import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../services/weather_service.dart';
import 'dashboard_card.dart';

/// Wetter-Kachel des Dashboards. Lädt echte Daten von Open-Meteo
/// und behandelt Lade- sowie Fehlerzustand.
class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final WeatherService _weatherService = WeatherService();
  late Future<WeatherData> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = _weatherService.fetchCurrentWeather();
  }

  void _reload() {
    setState(() {
      _weatherFuture = _weatherService.fetchCurrentWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Wetter – Frankfurt am Main',
      icon: Icons.wb_sunny_outlined,
      child: FutureBuilder<WeatherData>(
        future: _weatherFuture,
        builder: (context, snapshot) {
          // Ladezustand
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          // Fehlerfall
          if (snapshot.hasError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wetterdaten konnten nicht geladen werden.',
                  style: TextStyle(color: Colors.red[700]),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _reload,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Erneut versuchen'),
                ),
              ],
            );
          }

          final weather = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${weather.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      weather.description,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 20,
                runSpacing: 8,
                children: [
                  _WeatherStat(
                    label: 'Gefühlt',
                    value:
                        '${weather.apparentTemperature.toStringAsFixed(1)}°C',
                  ),
                  _WeatherStat(
                    label: 'Luftfeuchtigkeit',
                    value: '${weather.humidity}%',
                  ),
                  _WeatherStat(
                    label: 'Wind',
                    value: '${weather.windSpeed.toStringAsFixed(1)} km/h',
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Aktualisiert: ${_formatTime(weather.updatedAt)}',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m Uhr';
  }
}

class _WeatherStat extends StatelessWidget {
  final String label;
  final String value;

  const _WeatherStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
