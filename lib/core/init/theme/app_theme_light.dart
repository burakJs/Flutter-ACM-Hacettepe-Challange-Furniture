import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/ilight_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        bottomNavigationBarTheme: ThemeData.light().bottomNavigationBarTheme.copyWith(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.red,
            ),
        colorScheme: _appColorsScheme,
        scaffoldBackgroundColor: Color(0xffE9E7EB),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              brightness: Brightness.light,
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black87, size: 21),
            ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: _appColorsScheme.secondary,
          ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          filled: true,
        ),
      );

  ColorScheme get _appColorsScheme {
    return ColorScheme(
      primary: colorSchemeLight!.mineShaft,
      primaryVariant: Colors.white,
      secondary: colorSchemeLight!.delta,
      secondaryVariant: colorSchemeLight!.amaranth,
      surface: colorSchemeLight!.ronchi,
      background: colorSchemeLight!.eastBay,
      error: colorSchemeLight!.calypso,
      onPrimary: colorSchemeLight!.trendyPink,
      onSecondary: colorSchemeLight!.shark,
      onSurface: Color(0xffE9E7EB),
      onBackground: Colors.black12,
      onError: Color(0xFFFABD23),
      brightness: Brightness.light,
    );
  }
}
