// weather model is used to store the weather data
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class WeatherModel {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int visibility;
  final int cloudiness;
  final String description; //sunny, cloudy, rainy, etc.
  final String city;
  final String date; //date of the weather

  WeatherModel({
    required this.temperature,
    required this.description,
    required this.city,
    required this.date,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.visibility,
    required this.cloudiness,
  });

  // factory method to create a weather model from a json object
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // print the json data on weather
    // print('description: ${json['weather'][0]['description']}');
    // print('temp: ${json['main']['temp']}');
    // print('feels_like: ${json['main']['feels_like']}');
    // print('humidity: ${json['main']['humidity']}');
    // print('wind_speed: ${json['wind']['speed']}');
    // print('pressure: ${json['main']['pressure']}');
    // print('visibility: ${json['visibility']}');
    // print('clouds_all: ${json['clouds']['all']}');
    // print('name: ${json['name']}');
    // print('dt: ${json['dt']}');
    return WeatherModel(
      temperature: double.parse(json['main']['temp'].toString()).roundToDouble(),
      feelsLike: (double.parse(json['main']['feels_like'].toString()) * 10).round() / 10,
      humidity: int.parse(json['main']['humidity'].toString()),
      windSpeed: (double.parse(json['wind']['speed'].toString()) * 10).round() / 10,
      pressure: double.parse(json['main']['pressure'].toString()).round(),
      visibility: int.parse(json['visibility'].toString()),
      cloudiness: int.parse(json['clouds']['all'].toString()),
      description: json['weather'][0]['description'].toString().capitalize ?? 'N/A',
      city: json['name'].toString().capitalize ?? 'N/A',  
      date: DateTime.now().toString(),
    );
  }

}