import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherApiService {
  static String get _apiKey => dotenv.env['OPENWEATHER_API_KEY']!;
  final String baseURL = 'https://api.openweathermap.org/data/2.5/weather';



  /// Fetch weather by city name.
  Future<WeatherModel?> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse("$baseURL?q=$city&appid=$_apiKey&units=metric"),
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    }
    return null;
  }

  /// Fetch weather by coordinates (from geolocator).
  Future<WeatherModel?> fetchWeatherByLocation(double lat, double lon) async {
    final response = await http.get(
      Uri.parse("$baseURL?lat=$lat&lon=$lon&appid=$_apiKey&units=metric"),
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    }
    return null;
  }
}