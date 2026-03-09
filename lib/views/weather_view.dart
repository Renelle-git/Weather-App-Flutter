import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/views/details_view.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});
  @override
  Widget build(BuildContext context) {
    final weatherController = Get.find<WeatherController>();
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx((){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // top content
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 40,
                                color: AppColors.textPrimary,
                              ),
                              SizedBox(width: 6.0),
                              Expanded(
                                child: Text(
                                  weatherController.weather.value?.city ?? 'N/A',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: weatherController.isLoading.value
                                    ? null
                                    : () => weatherController.loadWeather(),
                                icon: Icon(Icons.my_location_rounded, color: AppColors.textPrimary),
                                tooltip: 'Use my location',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 8),
                              Text(
                                DateFormat('EEEE, MMMM yyyy').format(
                                  DateTime.parse(
                                    weatherController.weather.value?.date ?? DateTime.now().toString(),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.textPrimary,
                                  letterSpacing: 1.5,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          // temperature
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: weatherController
                                              .weather.value?.temperature.toString() ?? 'N/A',
                                          style: TextStyle(
                                            fontSize: 75,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textPrimary,
                                            height: 1,
                                          ),
                                        ),
                                        WidgetSpan(
                                          alignment: PlaceholderAlignment.top,
                                          child: Transform.translate(
                                            offset: Offset(0, -50),
                                            child: Text(
                                              '°C',
                                              style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                height: 1,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Text(
                                  //   '32°C',
                                  //   style: TextStyle(
                                  //     fontSize: 75,
                                  //     fontWeight: FontWeight.bold,
                                  //     height: 1,
                                  //   ),
                                  // ),
                                  Text(
                                    weatherController.weather.value?.description ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),

                              // main icon of weather
                              _WeatherIcon(icon: 'assets/images/sun.png'),
                              SizedBox(width: 1),
                              // Container(
                              //   margin: EdgeInsets.only(right: 10),
                              //   child: Image.asset('images/sun.png', width: 100, height: 100, fit: BoxFit.cover),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Details(),
            ],
          );
        }),
      ],
    );
  }

  
}


class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.asset(
          icon,
          width: (MediaQuery.of(context).size.shortestSide * 0.38).clamp(70.0, 180.0),
          height: (MediaQuery.of(context).size.shortestSide * 0.38).clamp(70.0, 180.0),
          fit: BoxFit.cover,
        );
      },
    );
  }
}


