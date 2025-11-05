import 'package:flutter/material.dart';

/// {@template app_shadow}
/// AppShadow centralizes all shadow styles used in the app.
/// This makes it consistent with Figma's "Effect Styles".
/// {@endtemplate}
class AppShadow {
  AppShadow._();

  /// Shadow 1 (light, subtle)
  static const shadow1 = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  /// Shadow 2 (medium)
  static const shadow2 = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  /// Shadow 3 (stronger)
  static const shadow3 = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ];

  /// Shadow 4 (heavier, used for modals/cards)
  static const shadow4 = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  /// Shadow for bottom sheets
  static const bottomSheet = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      blurRadius: 24,
      offset: Offset(0, -4),
    ),
  ];

  /// White shadows (used on dark backgrounds)
  static const shadow1White = [
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, 0.08),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const shadow4White = [
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, 0.15),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];
}
