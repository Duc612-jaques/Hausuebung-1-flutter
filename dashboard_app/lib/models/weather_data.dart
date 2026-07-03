class WeatherData {
  final double temperature;
  final double apparentTemperature;
  final int humidity;
  final double windSpeed;
  final int weatherCode;
  final DateTime updatedAt;

  WeatherData({
    required this.temperature,
    required this.apparentTemperature,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCode,
    required this.updatedAt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    return WeatherData(
      temperature: (current['temperature_2m'] as num).toDouble(),
      apparentTemperature:
          (current['apparent_temperature'] as num).toDouble(),
      humidity: (current['relative_humidity_2m'] as num).toInt(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      weatherCode: (current['weather_code'] as num).toInt(),
      updatedAt: DateTime.parse(current['time'] as String),
    );
  }

  /// Einfache textuelle Beschreibung anhand des WMO-Wettercodes.
  String get description => _weatherCodeToText(weatherCode);

  static String _weatherCodeToText(int code) {
    const map = {
      0: 'Klarer Himmel',
      1: 'Überwiegend klar',
      2: 'Teilweise bewölkt',
      3: 'Bedeckt',
      45: 'Nebel',
      48: 'Reifnebel',
      51: 'Leichter Nieselregen',
      53: 'Nieselregen',
      55: 'Starker Nieselregen',
      61: 'Leichter Regen',
      63: 'Regen',
      65: 'Starker Regen',
      71: 'Leichter Schneefall',
      73: 'Schneefall',
      75: 'Starker Schneefall',
      80: 'Regenschauer',
      81: 'Kräftige Regenschauer',
      82: 'Heftige Regenschauer',
      95: 'Gewitter',
      96: 'Gewitter mit Hagel',
      99: 'Starkes Gewitter mit Hagel',
    };
    return map[code] ?? 'Unbekannt';
  }
}
