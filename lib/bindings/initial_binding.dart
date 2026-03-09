// initial binding is used to initialize the controllers and services
// this is used to avoid the need to initialize the controllers and services in the main.dart file.

import 'package:get/get.dart';
import 'package:weather_app/controllers/navigation_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WeatherController(), permanent: true);
    Get.put(NavigationContoller(), permanent: true);
  }
}
