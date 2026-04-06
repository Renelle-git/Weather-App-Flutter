import 'package:flutter/material.dart';

class AppColors {
  // Tuned to AppGradients.purpleBlue (#4A2FCB → #2F80ED): softer saturation,
  // mist-toned text (less glare than pure white), and light frost glass on cards.
  static const Color primary = Color(0xFF7B6FF0); // Soft iris between gradient stops
  static const Color secondary = Color.fromARGB(255, 47, 128, 237); // Calm sky blue aligned with gradient end
  static const Color textPrimary = Color(0xFFEBEFFF); // Mist white — readable, easier on eyes
  static const Color textSecondary = Color(0xFFC5CBE5); // Cool lavender-gray for hierarchy
 // Frosted glass on the gradient — slight cool tint, not heavy purple wash
  static const Color cardBackground = Color.fromARGB(88, 232, 236, 255);
  // Curved nav track — darkened #4A2FCB (gradient start), same hue family as the bg
  static const Color navBarColor = Color(0xFFEBEFFF);
  static const Color navBarColorDark = Color.fromARGB(197, 49, 44, 65);

}
