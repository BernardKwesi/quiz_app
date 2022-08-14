import 'package:flutter/material.dart';
import 'package:quiz_app/config/themes/ui_parameters.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';

const mainGradientLight = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColorLight,
      primaryColorLight,
    ]);
const Color onSurfaceTextColor = Colors.white;
const mainGradientDark = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark,
    ]);

LinearGradient mainGradient(BuildContext context) {
  return UIParameters.isDarkMode(context)
      ? mainGradientDark
      : mainGradientLight;
}
