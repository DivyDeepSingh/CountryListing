// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider {
  static final ThemeProvider _themeProvider = ThemeProvider._internal();
  bool isLightMode = true;
  factory ThemeProvider() {
    return _themeProvider;
  }

  ThemeProvider._internal();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> getTheme() async {
    SharedPreferences pref = await _prefs;
    if (pref.containsKey("theme")) {
      isLightMode = pref.getBool("theme")!;
      return isLightMode;
    } else {
      return true;
    }
  }

  saveTheme({required bool value}) async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', value);
    isLightMode = value;
    return isLightMode;
  }
}
