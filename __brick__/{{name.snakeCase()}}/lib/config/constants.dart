import 'package:flutter/material.dart';

/// Collection of constants for {{name}}
class Constants {
  const Constants._(); // this basically makes it so you can't instantiate this class

  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static Curve curve = Curves.easeInOut;
  static Duration duration = const Duration(milliseconds: 150);
}
