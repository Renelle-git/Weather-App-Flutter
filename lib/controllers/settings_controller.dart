import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  /// 0 = system, 1 = light, 2 = dark
  final themeModeIndex = 0.obs;
  final useFahrenheit = false.obs;

  ThemeMode get themeMode {
    switch (themeModeIndex.value) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Get.changeThemeMode(themeMode);
    });
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    // Load and obtain the shared preferences for this app.
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', switch (mode) {
      ThemeMode.light => 1,
      ThemeMode.dark => 2,
      _ => 0,
    });
    themeModeIndex.value = prefs.getInt('themeMode') ?? 0;
    Get.changeThemeMode(themeMode);
  }

  String get themeModeLabel => switch (themeMode) {
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
        ThemeMode.system => 'System default',
      };

  Future<void> setUseFahrenheit(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('useFahrenheit', value);
     useFahrenheit.value = prefs.getBool('useFahrenheit') ?? false;
  }
}
