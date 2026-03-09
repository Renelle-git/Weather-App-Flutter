import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherApiService {
  static String get _apiKey => dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  final String baseURL = 'https://api.openweathermap.org/data/2.5/forecast';

  // fetch weather data from the api
  Future<WeatherModel?> fetchWeather(String city) async {
    // print('fetching weather for $city');
    final response = await http.get(
      Uri.parse(
        "$baseURL?q=$city&appid=$_apiKey&units=metric",
      ),
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      // print('Error: ${response.statusCode}');
      return null;
    }
  }
}