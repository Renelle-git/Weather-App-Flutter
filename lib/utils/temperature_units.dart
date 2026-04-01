/// API temps are Celsius (OpenWeatherMap `main.temp`).
class TemperatureUnits {
  TemperatureUnits._();

  static double toDisplayValue(double celsius, bool useFahrenheit) {
    if (useFahrenheit) return (celsius * 9 / 5) + 32;
    return celsius;
  }

  /// Integer display for large hero temp; F rounded, C rounded when whole.
  static String formatMain(double celsius, bool useFahrenheit) {
    if (useFahrenheit) {
      return (toDisplayValue(celsius, true)).round().toString();
    }

    final c = celsius;
    if (c == c.roundToDouble()) {
      return c.round().toString();
    }

    return c.toStringAsFixed(1);
  }

  static String suffix(bool useFahrenheit) => useFahrenheit ? '°F' : '°C';

  /// Feels-like / detail line (one decimal max in °C, rounded in °F).
  static String formatDetail(double celsius, bool useFahrenheit) {
    if (useFahrenheit) {
      return '${toDisplayValue(celsius, true).round()}${suffix(true)}';
    }
    final t = (celsius * 10).round() / 10; // round to 1 decimal place
    if (t == t.roundToDouble()) {
      return '${t.round()}${suffix(false)}';
    }
    return '${t.toStringAsFixed(1)}${suffix(false)}';
  }
}
