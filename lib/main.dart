import 'dart:io';

import 'package:almohagerlms/core/cubit/app_state.dart';
import 'package:almohagerlms/core/utils/check_permissions.dart';
import 'package:almohagerlms/core/utils/most_used_functions.dart';
import 'package:almohagerlms/features/splash_screen/presentation/screen_one.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/themes/light.dart';
import 'core/cubit/app_cubit.dart';
import 'core/storage/main_hive_box.dart';
import 'core/utils/app_const.dart';
import 'features/bloc_observer.dart';
import 'features/web_view/web_view_shared.dart';

class PlatformUtil {
  static const methodChannelName = 'io.alexmelnyk.utils';
  static const methodChannel = MethodChannel(methodChannelName);

  static Future<void> preventScreenCapture({bool enable = false}) {
    return methodChannel.invokeMethod<void>('preventScreenCapture', {
      'enable': enable,
    });
  }
}

Widget appStartScreen = const WebViewPage();

Future<void> startScreen() async {
  // dark mode ===>>>>
  AppCubit.isDark = await MainHiveBox.getIsDark();

  // intro screen ===>>>>
  final bool isIntroFinished = await MainHiveBox.getIsIntroSeen();

  // is logged in ===>>>>
  // final isLoggedIn = await MainHiveBox.getIsLoggedIn();

  // set start screen ===>>>>
  if (isIntroFinished) {
    appStartScreen = const WebViewPage();
  } else {
    appStartScreen = const WebViewPage();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await MainHiveBox().init();
  await startScreen();
  CheckAppPermissions.requestAllPermissions();

  // is tablet stop rotation ===>>>>
  if (MostUsedFunctions.isTablet) {
    // set landscape orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  } else {
    // set portrait orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Bloc.observer = MyBlocObserver();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      path: 'assets/translation',
      startLocale: const Locale('ar', 'SA'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final screenCaptureProtected = ValueNotifier(false);

  void _handleScreenCaptureTogglePressed() async {
    final nextValue = !screenCaptureProtected.value;
    await PlatformUtil.preventScreenCapture(enable: nextValue);
    screenCaptureProtected.value = nextValue;
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) _handleScreenCaptureTogglePressed();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: AppConst.appName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            themeMode: AppCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: SplashScreenOne(child: appStartScreen),
          );
        },
      ),
    );
  }
}
