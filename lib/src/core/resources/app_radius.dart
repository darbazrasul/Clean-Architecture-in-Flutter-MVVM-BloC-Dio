import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template app_radius}
/// Radius class contains all radius used in app
/// {@endtemplate}
class AppRadius {
  AppRadius._();

  /// Radius of 0.
  static const none = Radius.zero;

  /// Extra extra small radius of 2.
  static Radius xxs = Radius.circular(2.0.r);

  /// Extra small radius of 4.
  static Radius xs = Radius.circular(4.0.r);

  /// Small radius of 8.
  static Radius sm = Radius.circular(8.0.r);

  /// Medium radius of 12.
  static Radius md = Radius.circular(12.0.r);

  /// Large radius of 16.
  static Radius lg = Radius.circular(16.0.r);

  /// Extra large radius of 24.

  static Radius xl = Radius.circular(24.0.r);
}
