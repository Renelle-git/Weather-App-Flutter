import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/views/details_view.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});
  @override
  Widget build(BuildContext context) {
    final weatherController = Get.find<WeatherController>();
    final weatherIcon = weatherController.weather.value?.icon;
    // print('weatherIcon: $weatherIcon');
    // String weatherIconPath = '';
    // if(weatherIcon == 'rain') {
    //   weatherIconPath = 'assets/images/heavy-rain.png';
    // } else if(weatherIcon == 'sun') {
    //   weatherIconPath = 'assets/images/sun.png';
    // } else if(weatherIcon == 'clouds') {
    //   weatherIconPath = 'assets/images/cloudy.png';
    // } else if(weatherIcon == 'snow') {
    //   weatherIconPath = 'assets/images/snow.png';
    // } else if(weatherIcon == 'thunderstorm') {
    //   weatherIconPath = 'assets/images/thunder.png';
    // }else{
    //   weatherIconPath = 'assets/images/sun.png';
    // }

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
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
                                  weatherController.weather.value?.city ??
                                      'N/A',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              /// Refresh
                              IconButton(
                                onPressed: weatherController.isLoading.value
                                    ? null
                                    : () => weatherController.loadWeather(),
                                icon: Icon(
                                  Icons.autorenew_rounded,
                                  color: AppColors.textPrimary,
                                ),
                                tooltip: 'Refresh',
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              /// More settings
                              IconButton(
                                onPressed: () => _MoreSettings(),
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  color: AppColors.textPrimary,
                                ),
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 8),
                              Text(
                                DateFormat('EEEE, MMMM yyyy').format(
                                  DateTime.parse(
                                    weatherController.weather.value?.date ??
                                        DateTime.now().toString(),
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
                                          text:
                                              weatherController
                                                  .weather
                                                  .value
                                                  ?.temperature
                                                  .toString() ??
                                              'N/A',
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
                                    weatherController
                                            .weather
                                            .value
                                            ?.description ??
                                        'N/A',
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
                              _WeatherIcon(icon: weatherIcon ?? ''),
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

/// Maps OpenWeatherMap icon codes (e.g. 01d, 10n) to weather_icons.
const Map<String, IconData> _owmToWeatherIcon = {
  '01d': WeatherIcons.day_sunny,
  '01n': WeatherIcons.night_clear,
  '02d': WeatherIcons.day_cloudy,
  '02n': WeatherIcons.night_alt_cloudy,
  '03d': WeatherIcons.day_cloudy_gusts,
  '03n': WeatherIcons.night_alt_cloudy_gusts,
  '04d': WeatherIcons.day_sunny_overcast,
  '04n': WeatherIcons.night_alt_cloudy,
  '09d': WeatherIcons.day_showers,
  '09n': WeatherIcons.night_alt_showers,
  '10d': WeatherIcons.day_rain,
  '10n': WeatherIcons.night_alt_rain,
  '11d': WeatherIcons.day_thunderstorm,
  '11n': WeatherIcons.night_alt_thunderstorm,
  '13d': WeatherIcons.day_snow,
  '13n': WeatherIcons.night_alt_snow,
  '50d': WeatherIcons.day_fog,
  '50n': WeatherIcons.night_fog,
};

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.shortestSide * 0.38).clamp(50.0, 110.0);
    final iconData = _owmToWeatherIcon[icon] ?? WeatherIcons.day_sunny;
    return BoxedIcon(
      iconData,
      size: size,
      color: AppColors.textPrimary,
    );
  }
}


class _MoreSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
