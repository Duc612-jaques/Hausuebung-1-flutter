import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_data.dart';

/// Service-Klasse, die aktuelle Wetterdaten von der kostenlosen
/// Open-Meteo-API abruft (kein API-Key erforderlich).
/// Dokumentation: https://open-meteo.com/en/docs
class WeatherService {
  // Koordinaten Frankfurt am Main
  static const double _latitude = 50.58;
  static const double _longitude = 8.68;

  static const String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<WeatherData> fetchCurrentWeather() async {
    final uri = Uri.parse(
      '$_baseUrl?latitude=$_latitude&longitude=$_longitude'
      '&current=temperature_2m,relative_humidity_2m,apparent_temperature,'
      'weather_code,wind_speed_10m&timezone=Europe%2FBerlin',
    );

    final response = await http.get(uri).timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception(
        'Wetterdaten konnten nicht geladen werden (Status ${response.statusCode})',
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return WeatherData.fromJson(data);
  }
}
