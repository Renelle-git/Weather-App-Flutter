import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/controllers/settings_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsController>();
    final weather = Get.find<WeatherController>();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                _sectionLabel('Appearance'),
                Obx(() => ListTile(
                      leading: Icon(
                        Icons.palette_outlined,
                        color: AppColors.textPrimary,
                      ),
                      title: Text(
                        'Theme',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: Text(
                        settings.themeModeLabel,
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: AppColors.textSecondary,
                      ),
                      onTap: () => _showThemeSheet(context, settings),
                    )),
                const Divider(height: 1, color: Colors.white24),
                _sectionLabel('Weather'),
                Obx(() => SwitchListTile(
                      secondary: Icon(
                        Icons.thermostat_outlined,
                        color: AppColors.textPrimary,
                      ),
                      title: Text(
                        'Temperature in Fahrenheit',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: Text(
                        settings.useFahrenheit.value
                            ? 'Showing °F'
                            : 'Showing °C',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      activeThumbColor: AppColors.textPrimary,
                      activeTrackColor: AppColors.primary,
                      value: settings.useFahrenheit.value,
                      onChanged: settings.setUseFahrenheit,
                    )),
                Obx(() {
                  final busy = weather.isLoading.value;
                  return ListTile(
                    leading: Icon(
                      Icons.refresh_rounded,
                      color: AppColors.textPrimary,
                    ),
                    title: Text(
                      'Refresh weather',
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                    subtitle: Text(
                      busy
                          ? 'Loading…'
                          : 'Fetch the latest data for your location',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    onTap: busy ? null : () => weather.loadWeather(),
                  );
                }),
                const Divider(height: 1, color: Colors.white24),
                _sectionLabel('Help & info'),
                ListTile(
                  leading: Icon(
                    Icons.help_outline_rounded,
                    color: AppColors.textPrimary,
                  ),
                  title: Text(
                    'Help',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  subtitle: Text(
                    'How the app uses location and data',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: AppColors.textSecondary,
                  ),
                  onTap: () => _showHelpDialog(context),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.textPrimary,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  subtitle: Text(
                    'Weather App',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  onTap: () => _showAboutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  void _showThemeSheet(BuildContext context, SettingsController settings) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.navBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Obx(() {
            settings.themeModeIndex.value;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Theme',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'System default',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  trailing: settings.themeMode == ThemeMode.system
                      ? Icon(Icons.check, color: AppColors.secondary)
                      : null,
                  onTap: () {
                    settings.setThemeMode(ThemeMode.system);
                    Navigator.pop(ctx);
                  },
                ),
                ListTile(
                  title: Text(
                    'Light',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  trailing: settings.themeMode == ThemeMode.light
                      ? Icon(Icons.check, color: AppColors.secondary)
                      : null,
                  onTap: () {
                    settings.setThemeMode(ThemeMode.light);
                    Navigator.pop(ctx);
                  },
                ),
                ListTile(
                  title: Text(
                    'Dark',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  trailing: settings.themeMode == ThemeMode.dark
                      ? Icon(Icons.check, color: AppColors.secondary)
                      : null,
                  onTap: () {
                    settings.setThemeMode(ThemeMode.dark);
                    Navigator.pop(ctx);
                  },
                ),
                const SizedBox(height: 8),
              ],
            );
          }),
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.navBarColor,
        title: Text(
          'Help',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Text(
            'Location\n'
            'This app needs your location to show weather where you are. '
            'If permission is denied, enable it in system settings or use '
            'Refresh after allowing access.\n\n'
            'Refresh\n'
            'Use the refresh icon (🔄️) on the weather screen or '
            '"Refresh weather" here to load the latest forecast.\n\n'
            'Theme & units\n'
            'Change appearance and °C/°F anytime from this screen. '
            'These choices apply until you close the app unless you add '
            'saved preferences later.',
            style: TextStyle(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'OK',
              style: TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Weather App',
      applicationIcon: Image.asset(
        'assets/AppIcon/appIcon.png',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
      applicationVersion: '1.0.0',
      applicationLegalese: 'Developed by Renelle Q.',
      children: [
        const SizedBox(height: 12),
        Text(
          'Shows current weather for your location using live forecast data.',
        ),
      ],
    );
  }
}
