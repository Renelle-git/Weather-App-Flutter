import 'package:get/get.dart';
import 'package:weather_app/services/weather_api_services.dart';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  var weather = Rxn<WeatherModel>();
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final WeatherApiService _apiService = WeatherApiService();

  @override
  void onInit() {
    // SAMPLE DATA
    // weather.addAll([
    //   WeatherModel(
    //     temperature: 40,
    //     description: 'Sunny',
    //     city: 'Manila',
    //     date: DateTime.now().toString(),
    //     feelsLike: 25,
    //     humidity: 50,
    //     windSpeed: 10,
    //     pressure: 1000,
    //     visibility: 100,
    //     cloudiness: 50,
    //   ),
    // ]);
    super.onInit();
    fetchWeather('La Union'); // Load weather when screen opens
  }

  // fetch weather data from the api
  void fetchWeather(String city) async {
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
