import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_api_services.dart';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  var weather = Rxn<WeatherModel>();
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final WeatherApiService _apiService = WeatherApiService();

  @override
  void onInit() {
    super.onInit();
    // Delay until after first frame so the Activity is ready — permission dialog shows reliably on Android.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadWeather();
    });
  }

  /// Load weather: try device location first (shows permission dialog if needed), fallback to default city.
  Future<void> loadWeather() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final position = await determinePosition();

      // print('position: $position');
      if (position != null) {
        final data = await _apiService.fetchWeatherByLocation(
          position.latitude,
          position.longitude,
        );
        if (data != null) {
          weather.value = data;
          return;
        }
      }

      // final data = await _apiService.fetchWeather('La Union');
      // if (data != null) {
      //   weather.value = data;
      // } else {
      //   errorMessage.value = 'No weather data found';
      // }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch weather for a specific city (e.g. from search).
  Future<void> fetchWeather(String city) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final data = await _apiService.fetchWeather(city);
      if (data != null) {
        weather.value = data;
      } else {
        errorMessage.value = 'No weather data found';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
