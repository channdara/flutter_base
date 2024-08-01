import 'package:flutter/material.dart';

mixin MaterialColorUtil {
  static MaterialColor fromString(String hexColorCode) {
    final code = hexColorCode.replaceAll(RegExp(r'[^0-9a-zA-Z]'), '');
    if (code.length != 6) return Colors.blue;
    final color = _stringToColor(code);
    final tints = List.generate(5, (index) {
      final r = _calculateTint(color.red, index);
      final g = _calculateTint(color.green, index);
      final b = _calculateTint(color.blue, index);
      return Color.fromRGBO(r, g, b, 1.0);
    }).reversed.toList();
    final shades = List.generate(4, (index) {
      final r = _calculateShaded(color.red, index);
      final g = _calculateShaded(color.green, index);
      final b = _calculateShaded(color.blue, index);
      return Color.fromRGBO(r, g, b, 1.0);
    }).toList();
    final material = <Color>[...tints, color, ...shades];
    return MaterialColor(color.value, <int, Color>{
      50: material[0],
      100: material[1],
      200: material[2],
      300: material[3],
      400: material[4],
      500: material[5],
      600: material[6],
      700: material[7],
      800: material[8],
      900: material[9],
    });
  }

  static MaterialColor fromColor(Color color) {
    final tints = List.generate(5, (index) {
      final r = _calculateTint(color.red, index);
      final g = _calculateTint(color.green, index);
      final b = _calculateTint(color.blue, index);
      return Color.fromRGBO(r, g, b, 1.0);
    }).reversed.toList();
    final shades = List.generate(4, (index) {
      final r = _calculateShaded(color.red, index);
      final g = _calculateShaded(color.green, index);
      final b = _calculateShaded(color.blue, index);
      return Color.fromRGBO(r, g, b, 1.0);
    }).toList();
    final material = <Color>[...tints, color, ...shades];
    return MaterialColor(color.value, <int, Color>{
      50: material[0],
      100: material[1],
      200: material[2],
      300: material[3],
      400: material[4],
      500: material[5],
      600: material[6],
      700: material[7],
      800: material[8],
      900: material[9],
    });
  }

  static Color _stringToColor(String code) =>
      Color(int.parse('FF${code.toUpperCase()}', radix: 16));

  static int _calculateTint(int color, int index) {
    final tint = double.parse((0.1 * (index + 1)).toStringAsFixed(1));
    return (color + ((255 - color) * tint)).toInt();
  }

  static int _calculateShaded(int color, int index) {
    final shades = 1.0 - (0.1 * (index + 1));
    return (color * shades).toInt();
  }
}
