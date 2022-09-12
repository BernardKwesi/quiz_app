import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'ui_parameters.dart';

TextStyle cartTiles(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

const detailText = TextStyle(fontSize: 14);
const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
