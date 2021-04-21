import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();
  final Color mineShaft = Color(0xff323232); //Text
  final Color eastBay = Color(0xff464A7A); //Card Bg
  final Color amaranth = Color(0xffE5204A); //Hearth fill
  final Color delta = Color(0xFFAFAFAE); //Search Text Color
  final Color ronchi = Color(0xFFEBB74F); //Star
  final Color calypso = Color(0xFF387196); //Star
  final Color trendyPink = Color(0xFF866B96); //Star
  final Color shark = Color(0xFF2C2E33); //Star
}

//387196 - 866B96 - 2C2E33
