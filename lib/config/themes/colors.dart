import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor cPrimary = MaterialColor(
    0xffCE8C07,
    <int, Color>{
      50: Color(0xffCE8C07),
      100: Color(0xffCE8C07),
      200: Color(0xffCE8C07),
      300: Color(0xffCE8C07),
      400: Color(0xffCE8C07),
      500: Color(0xffCE8C07),
      600: Color(0xffCE8C07),
      700: Color(0xffCE8C07),
      800: Color(0xffCE8C07),
      900: Color(0xffCE8C07),
    },
  );

  static const cSecondary = Color(0xff000000);

  static const cError = Colors.red;

  /// backgrounds
  static const cScaffoldBackgroundColorLight = cSecondary;
  static const cScaffoldBackgroundColorDark = Color(0xff000000);
  static const cAppBarLight = cSecondary;
  static const cAppBarDark = Color(0xff000000);

  static const cBottomBarLight = cSecondary;
  static const cBottomBarDark = Color(0xff000000);

  /// icons
  static const cSelectedIcon = Color(0xffCE8C07);
  static const cUnSelectedIconLight = Colors.black;
  static const cUnSelectedIconDark = Colors.white;

  static const cAppBarIconLight = Colors.white;
  static const cAppBarIconDark = Colors.white;

  static const cIconLight = Colors.black;
  static const cIconDark = Colors.white;

  /// textformfield
  static const cFillTextFieldLight = Color(0xffF9F9F9);
  static const cFillTextFieldDark = Color(0xb33669a1);

  /// cards
  static const cCardLight = Color(0xffF5F5F5);
  static const cCardDark = Color(0xff0a1217);

  /// divider
  static const cDividerLight = Color(0xffE5E5E5);
  static const cDividerDark = Color(0xff454545);

  /// text color
  static const cTextLight = cSecondary;
  static const cTextDark = Colors.white;
  static const cAppBarTextLight = cSecondary;
  static const cAppBarTextDark = Colors.white;
  static Color cTextSubtitleLight = Colors.grey[300]!;
  static const cTextSubtitleDark = Colors.white;
}
