import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app/bindings/initial_binding.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/constants/background_color.dart';
import 'package:weather_app/views/main_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(), // initial binding is used to initialize the controllers and services
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary) ,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: AppGradients.purpleBlue,
              ),
            ),
            child!, // the child is the MainScreen
          ],
        );
      },
      home: MainScreen(),
    );
  }
}
