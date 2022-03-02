import 'package:country_sorting/providers/themeProvider.dart';
import 'package:flutter/material.dart';

class Common {
  bool isDarkMode() {
    return !ThemeProvider().isLightMode;
  }

  bool isPortrait({required BuildContext context}) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
