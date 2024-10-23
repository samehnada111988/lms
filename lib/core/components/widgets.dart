import 'package:almohagerlms/core/res/app_images.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 40,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetImagesPath.appLogo,
      fit: BoxFit.contain,
      height: size,
      width: size,
    );
  }
}
