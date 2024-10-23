import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void navigateToPage(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  void navigateToPageWithReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void navigateToPageWithClearStack(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
