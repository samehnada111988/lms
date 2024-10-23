import 'package:almohagerlms/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_sizes.dart';

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: AppColors.cIconLight),
      primaryColor: AppColors.cPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.cPrimary,
        //secondary: AppColors.cPrimary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.cPrimary),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.cDividerLight),
      primarySwatch: AppColors.cPrimary,
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        unselectedLabelColor: AppColors.cTextSubtitleLight,
        labelStyle: const TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.w600,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.cSecondary,
            width: 2.0,
          ),
          insets: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'vazir',
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.f16,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.cAppBarLight,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: AppColors.cBottomBarLight,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarContrastEnforced: false,
        ),
        iconTheme: IconThemeData(
          color: AppColors.cAppBarIconLight,
        ),
      ),
      //primarySwatch: MyColors.cPrimary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.cPrimary,
      ),
      fontFamily: 'vazir',
      textTheme: const TextTheme(
        labelLarge: TextStyle(),
        labelMedium: TextStyle(),
        labelSmall: TextStyle(),
        titleLarge: TextStyle(),
        titleMedium: TextStyle(),
        titleSmall: TextStyle(),
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(),
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
      ).apply(
        bodyColor: AppColors.cTextLight,
        displayColor: Colors.blue,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          size: 30.0,
          color: AppColors.cPrimary.withOpacity(0.5),
        ),
        selectedIconTheme: const IconThemeData(
          size: 30.0,
          color: AppColors.cPrimary,
        ),
        backgroundColor: AppColors.cBottomBarLight,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cPrimary.withOpacity(0.5),
        elevation: 40,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.cPrimary,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.cPrimary.withOpacity(0.5),
        ),
      ),
      scaffoldBackgroundColor: AppColors.cScaffoldBackgroundColorLight,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.cPrimary,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.cIconLight,
        textColor: AppColors.cTextLight,
        selectedColor: AppColors.cSelectedIcon,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.cSecondary,
      ),
    );
