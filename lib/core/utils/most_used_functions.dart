import 'package:almohagerlms/core/utils/app_const.dart';
import 'package:flutter/cupertino.dart';

class MostUsedFunctions {
  static bool get isTablet {
    final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
    final logicalShortestSide =
        firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
    debugPrint('logicalShortestSide: $logicalShortestSide');
    return logicalShortestSide > 600;
  }

  // print full text in console ===>>>
  static void printFullText(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach(
          (match) => debugPrint(
            match.group(0).toString(),
          ),
        );
  }

  static bool isContainsSocial(String host) {
    return AppConst.listOfSocials.any(
      (element) => host.toLowerCase().contains(element.toLowerCase()),
    );
  }

  static bool isContainsExtension(String host) {
    return AppConst.allExtensions.any(
      (element) => host.toLowerCase().contains(element.toLowerCase()),
    );
  }
}
