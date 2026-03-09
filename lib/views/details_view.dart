import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class Details extends StatelessWidget {
  Details({super.key});

  final weatherController = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final w = weatherController.weather.value;

      // if(w == null) {
      //   return Center(
      //     child: Text('No weather data found'),
      //   );
      // }

      // if(weatherController.isLoading.value) {
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }

      // if(weatherController.errorMessage.value.isNotEmpty) {
      //   return Center(
      //     child: Text(weatherController.errorMessage.value),
      //   );
      // }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // middle content
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Details'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: AppColors.textPrimary,
                    height: 1,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = MediaQuery.sizeOf(context).width;
              final shortestSide = MediaQuery.sizeOf(context).shortestSide;
              final cardHeight = shortestSide * 0.25;
              final padding = (shortestSide * 0.02).clamp(6.0, 14.0);
              final iconSize = (shortestSide * 0.065).clamp(24.0, 36.0);
              final valueFontSize = (width * 0.048).clamp(14.0, 22.0);
              final labelFontSize = (width * 0.032).clamp(11.0, 16.0);
              return Container(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Expanded(
                            child: _DetailsCard(
                              icon: Icons.thermostat_rounded,
                              value: '${w?.feelsLike}°C',
                              label: 'Feels Like',
                              cardHeight: cardHeight,
                              padding: padding,
                              iconSize: iconSize,
                              valueFontSize: valueFontSize,
                              labelFontSize: labelFontSize,
                            ),
                          ),
                        ),
                        SizedBox(width: padding),
                        Expanded(
                          child: _DetailsCard(
                            icon: Icons.air_rounded,
                            value: '${w?.windSpeed} km/h',
                            label: 'Wind Speed',
                            cardHeight: cardHeight,
                            padding: padding,
                            iconSize: iconSize,
                            valueFontSize: valueFontSize,
                            labelFontSize: labelFontSize,
                          ),
                        ),
                        SizedBox(width: padding),
                        Expanded(
                          child: _DetailsCard(
                            icon: Icons.water_drop_rounded,
                            value: '${w?.humidity}%',
                            label: 'Humidity',
                            cardHeight: cardHeight,
                            padding: padding,
                            iconSize: iconSize,
                            valueFontSize: valueFontSize,
                            labelFontSize: labelFontSize,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _DetailsCard(
                            icon: FontAwesomeIcons.gaugeHigh,
                            value: '${w?.pressure} hPa',
                            label: 'Pressure',
                            cardHeight: cardHeight,
                            padding: padding,
                            iconSize: iconSize,
                            valueFontSize: valueFontSize,
                            labelFontSize: labelFontSize,
                          ),
                        ),
                        SizedBox(width: padding),
                        Expanded(
                          child: _DetailsCard(
                            icon: FontAwesomeIcons.eye,
                            value: '${w?.visibility} km',
                            label: 'Visibility',
                            cardHeight: cardHeight,
                            padding: padding,
                            iconSize: iconSize,
                            valueFontSize: valueFontSize,
                            labelFontSize: labelFontSize,
                          ),
                        ),
                        SizedBox(width: padding),
                        Expanded(
                          child: _DetailsCard(
                            icon: FontAwesomeIcons.cloud,
                            value: '${w?.cloudiness}%',
                            label: 'Clouds',
                            cardHeight: cardHeight,
                            padding: padding,
                            iconSize: iconSize,
                            valueFontSize: valueFontSize,
                            labelFontSize: labelFontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.cardHeight,
    required this.padding,
    required this.iconSize,
    required this.valueFontSize,
    required this.labelFontSize,
  });

  final IconData icon;
  final String value;
  final String label;
  final double cardHeight;
  final double padding;
  final double iconSize;
  final double valueFontSize;
  final double labelFontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Card(
        color: AppColors.cardBackground,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(icon, size: iconSize, color: AppColors.textPrimary),
              Text(
                value,
                style: TextStyle(
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
