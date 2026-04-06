import 'package:flutter/material.dart';

class AppBackground {
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
      Color.fromARGB(255, 8, 6, 20),
      Color.fromARGB(255, 10, 30, 54),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


  static const Color darkBackground = Colors.black;
  static const Color lightBackground = Color.fromARGB(255, 47, 128, 237);
}
