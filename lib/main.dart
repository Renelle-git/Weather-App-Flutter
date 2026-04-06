import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/bindings/initial_binding.dart';
import 'package:weather_app/constants/background_color.dart';
import 'package:weather_app/controllers/settings_controller.dart';
import 'package:weather_app/views/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final prefs = await SharedPreferences.getInstance();
  final savedThemeIndex = prefs.getInt('themeMode') ?? 0;
  final settings = SettingsController();
  settings.themeModeIndex.value = savedThemeIndex;
  final savedUseFahrenheit = prefs.getBool('useFahrenheit') ?? false;
  settings.useFahrenheit.value = savedUseFahrenheit;
  Get.put(settings, permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppBackground.lightBackground,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.transparent,
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppBackground.darkBackground,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      themeMode: Get.find<SettingsController>().themeMode,

      builder: (context, child) {
        final brightness = Theme.of(context).brightness;

        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: brightness == Brightness.dark
                    ? AppBackground.darkBackground
                    : AppBackground.lightBackground,
              ),
            ),
            child!,
          ],
        );
      },
      home: const MainScreen(),
    );
  }
}
