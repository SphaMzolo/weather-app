import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const apiKey = 'ee1071b8ff590682fb1aa6b9acf78859';

class WeatherData {
  final String? weatherDescription;
  final double? temperature;
  final String? weatherIcon;
  double? feelslike;
  final int? pressure;
  final int? humidity;
  final double? windspeed;
  final DateTime? sunrise;
  final DateTime? sunset;

  WeatherData({
    this.weatherDescription,
    this.temperature,
    this.weatherIcon,
    this.feelslike,
    this.pressure,
    this.humidity,
    this.windspeed,
    this.sunset,
    this.sunrise,
  });

  factory WeatherData.toModel(Map<String, dynamic> json) => WeatherData(
        weatherDescription: json['weather'][0]['description'],
        temperature: json['main']['temp'],
        weatherIcon: json['weather'][0]['icon'],
        feelslike: json['main']['feels_like'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        windspeed: json['wind']['speed'],
        sunrise: DateTime.fromMillisecondsSinceEpoch(
          (json['sys']['sunrise'] * 1000),
        ),
        sunset: DateTime.fromMillisecondsSinceEpoch(
          (json['sys']['sunset'] * 1000),
        ),
      );
}

class WeatherApi with ChangeNotifier {
  String _searchCity = '';
  WeatherData _weatherInfo = WeatherData();
  bool _refreshing = false;
  bool _emptyData = true;

  String get citySearched => _searchCity;
  WeatherData get weatherInfo => _weatherInfo;
  bool get refreshing => _refreshing;
  bool get emptyData => _emptyData;

  set cityInput(String cityName) {
    _searchCity = cityName;
    notifyListeners();
  }

  getWeather(String city) async {
    _weatherInfo.feelslike = null;
    _refreshing = true;

    try {
      final url =
          'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=ee1071b8ff590682fb1aa6b9acf78859';
      final response = await http.get(Uri.parse(url));
      final data = await jsonDecode(response.body);
      _weatherInfo = WeatherData.toModel(data);
      _emptyData = false;
    } catch (e) {
      _emptyData = false;
      _refreshing = false;
    }
    notifyListeners();
  }
}
