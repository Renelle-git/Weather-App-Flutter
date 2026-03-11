import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/navigation_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/views/activities_view.dart';
import 'package:weather_app/views/weather_view.dart';
import 'package:weather_app/constants/app_color.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // pages for the IndexedStack
  List<Widget> get pages => [
    Weather(),
    Activities(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationContoller>();
    final weatherController = Get.find<WeatherController>();

    return Obx(() {
      if (weatherController.isLoading.value) {
        return const Center(
          child: Center(
            child: SafeArea(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator( color: AppColors.textPrimary),
                SizedBox(height: 10),
                Text('Loading weather data...', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                ),
              ],
            ),
            ),
          ),
        );
      }
      if (weatherController.errorMessage.value.isNotEmpty) {
        return SafeArea(
          child: Center(
            child: AlertDialog(
              icon: Icon(Icons.error),
              title: Text('Error'),
              content: Text(weatherController.errorMessage.value, textAlign: TextAlign.center,),
            ),
          ),
        );
      }  

      return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: navigationController.selectedIndex.value,
            children: pages,
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Obx(
          () => NavigationBar(
            selectedIndex: navigationController.selectedIndex.value,
            onDestinationSelected: navigationController.changeIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.wb_sunny_outlined),
                selectedIcon: Icon(Icons.wb_sunny),
                label: 'Weather',
              ),
              NavigationDestination(
                icon: Icon(Icons.list_outlined),
                selectedIcon: Icon(Icons.list),
                label: 'Activities',
              ),
            ],
          ),
        ),
      ),
    );
    });
  }
}

