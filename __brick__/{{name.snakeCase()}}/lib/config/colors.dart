import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Collection of colors for {{name}}
class AppColors {
  const AppColors._(); // this basically makes it so you can't instantiate this class

  static const Color none = Color(0x00000000);

  //  BACKGROUND  //
  //-----------------------------------------------
  static const Color _backgroundDark = Color(0xFF333333);
  static const Color _backgroundLight = Color(0xFFCDCFD0);

  static Color background(BuildContext c) =>
      c.isDarkMode ? _backgroundDark : _backgroundLight;

  //  PRIMARY  //
  // -----------------------------------------------------
  static const Color _primaryDark = Color(0xFF6E449B);
  static const Color _primaryLight = Color(0xFF6E449B);

  static const Color primaryLight = _primaryLight;
  static const Color primaryDark = _primaryDark;

  static Color primary(BuildContext context) =>
      context.isDarkMode ? _primaryDark : _primaryLight;

  //  ACCENT  //
  // -----------------------------------------------------
  static const Color accentDark = Color(0xFFFFDE17);
  static const Color accentLight = Color(0xFFFFDE17);

  static Color accent(BuildContext context) =>
      context.isDarkMode ? accentDark : accentLight;

  //  PURPLE  //
  // -----------------------------------------------------
  static const Color purple900 = Color(0xFF2B0039);
  static const Color purple800 = Color(0xFF38004B);
  static const Color purple700 = Color(0xFF480061);
  static const Color purple600 = Color(0xFF5D007C);
  static const Color purple500 = Color(0xFF660088);
  static const Color purple400 = Color(0xFF8533A0);
  static const Color purple300 = Color(0xFF9854AF);
  static const Color purple200 = Color(0xFFB98AC8);
  static const Color purple100 = Color(0xFFD0B0DA);
  static const Color purple50 = Color(0xFFF0E6F3);

  //  YELLOW  //
  // -----------------------------------------------------
  static const Color yellow900 = Color(0xFF6B4C0F);
  static const Color yellow800 = Color(0xFF8C6414);
  static const Color yellow700 = Color(0xFFB5811A);
  static const Color yellow600 = Color(0xFFE8A621);
  static const Color yellow500 = Color(0xFFFFB624);
  static const Color yellow400 = Color(0xFFFFC550);
  static const Color yellow300 = Color(0xFFFFCE6C);
  static const Color yellow200 = Color(0xFFFFDD9A);
  static const Color yellow100 = Color(0xFFFFE8BB);
  static const Color yellow50 = Color(0xFFFFF8E9);

  //  GREEN  //
  // -----------------------------------------------------
  static const Color green900 = Color(0xFF035331);
  static const Color green800 = Color(0xFF036C40);
  static const Color green700 = Color(0xFF048C53);
  static const Color green600 = Color(0xFF05B36A);
  static const Color green500 = Color(0xFF06C575);
  static const Color green400 = Color(0xFF38D191);
  static const Color green300 = Color(0xFF58D8A3);
  static const Color green200 = Color(0xFF8CE4C0);
  static const Color green100 = Color(0xFFB2EDD4);
  static const Color green50 = Color(0xFFE6F9F1);

  //  RED  //
  // -----------------------------------------------------
  static const Color red900 = Color(0xFF6B0A1D);
  static const Color red800 = Color(0xFF8C0D25);
  static const Color red700 = Color(0xFFB51030);
  static const Color red600 = Color(0xFFE8153E);
  static const Color red500 = Color(0xFFFF1744);
  static const Color red400 = Color(0xFFFF4569);
  static const Color red300 = Color(0xFFFF6482);
  static const Color red200 = Color(0xFFFF94A9);
  static const Color red100 = Color(0xFFFFB7C5);
  static const Color red50 = Color(0xFFFFE8EC);

  //  BLUE  //
  // -----------------------------------------------------
  static const Color blue900 = Color(0xFF00006B);
  static const Color blue800 = Color(0xFF00008C);
  static const Color blue700 = Color(0xFF00008C);
  static const Color blue600 = Color(0xFF0000B5);
  static const Color blue500 = Color(0xFF0000FF);
  static const Color blue400 = Color(0xFF3333FF);
  static const Color blue300 = Color(0xFF5454FF);
  static const Color blue200 = Color(0xFF8A8AFF);
  static const Color blue100 = Color(0xFFB0B0FF);
  static const Color blue50 = Color(0xFFE6E6FF);

  // NEUTRALS COLORS
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF231F20);
  static const Color dark = Color(0xFF303437);
  static const Color grey50 = Color(0xFFE7E6E7);
  static const Color grey100 = Color(0xFFB3B0B4);
  static const Color grey200 = Color(0xFF8E8A90);
  static const Color grey300 = Color(0xFF5B545D);
  static const Color grey400 = Color(0xFF3B333D);
  static const Color grey500 = Color(0xFF0A000D);

  // DARKEST COLORS
  static const Color error = Color(0xFFBF0F04);
  static const Color warning = Color(0xFFA05E03);
  static const Color success = Color(0xFF46B655);
  static const Color good = Color(0xFF198155);
  static const Color log = Color(0xFF2B2C2C);

  // COMPANY BG COLORS

  static const Color facebookBG = Color(0xFFF4F6FB);
  static const Color googleBG = Color(0xFFFEF2F1);
  static const Color twitterBG = Color(0xFFE7F5FE);

  // TRACKERS COLORS
  static const Color slider = Color(0xFFF4F4F4);
  static const Color activePoint = Color(0xFF46B655);
  static const Color disabledPoint = Color(0xFFCFCED0);
}
