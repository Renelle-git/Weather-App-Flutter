import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient purpleBlue = LinearGradient(
    colors: [
      Color.fromARGB(255, 74, 47, 203), // rich purple
      Color.fromARGB(255, 47, 128, 237), // vibrant blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkPurpleBlue = LinearGradient(
    colors: [
      Color(0xFF1A1240),
      Color(0xFF0D2848),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
