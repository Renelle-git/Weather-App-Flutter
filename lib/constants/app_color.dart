import 'package:flutter/material.dart';

class AppColors {
  // Harmonized with AppGradients.purpleBlue (purple #4A2FCB → blue #2F80ED)
  static const Color primary = Color(0xFF5B3DD6);   // Slightly brighter purple for buttons/accents
  static const Color secondary = Color(0xFF3D8EF5);  // Slightly brighter blue for links/secondary actions
  static const Color textPrimary = Color(0xFFF5F5FF); // Soft off-white for readability on gradient
  static const Color textSecondary = Color(0xFFB8BCE0); // Muted lavender that works on both gradient ends
  static const Color cardBackground = Color.fromARGB(140, 65, 55, 145); // Semi-transparent purple-tinted glass over gradient
  static const Color navBarColor = Color.fromARGB(245, 45, 52, 120);    // Deep purple-blue overlay on gradient
}
