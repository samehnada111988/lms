import 'dart:async';

import 'package:almohagerlms/core/extensions/navigation_extensions.dart';
import 'package:almohagerlms/core/utils/most_used_functions.dart';
import 'package:flutter/material.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Timer timer;
  String? long;
  String? lat;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    timer = Timer(
      const Duration(seconds: 5),
      () {
        context.navigateToPage(widget.child!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff323131),
      body: Image.asset(
        'assets/images/splash.gif',
        fit: MostUsedFunctions.isTablet ? BoxFit.contain : BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(
      //         MostUsedFunctions.isTablet
      //             ? AssetImagesPath.landscapeSplash
      //             : AssetImagesPath.splash,
      //       ),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   // loading animation in bottom
      //   child: FadeTransition(
      //     opacity: animation,
      //     child: Container(
      //       alignment: Alignment.bottomCenter,
      //       margin: const EdgeInsets.only(bottom: 50),
      //       child: const CircularProgressIndicator(
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
