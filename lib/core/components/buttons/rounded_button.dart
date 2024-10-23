import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../core/utils/app_sizes.dart';

class ReusedRoundedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? rowWidget;
  final double fontSize;
  final bool isLoading;
  final double height;
  final double width;
  final int badgeCount;
  final double radius;

  const ReusedRoundedButton({
    required this.text,
    required this.onPressed,
    this.color = AppColors.cPrimary,
    this.textColor,
    this.rowWidget,
    this.fontSize = AppFontSize.f14,
    this.height = 56,
    this.width = double.infinity,
    this.badgeCount = 0,
    this.isLoading = false,
    super.key,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      count: badgeCount,
      isLabelVisible: badgeCount != 0,
      backgroundColor: AppColors.cError,
      largeSize: AppFontSize.f22,
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: AppFontSize.f10,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor:
                  WidgetStateProperty.all(Colors.grey.withOpacity(.5)),
              alignment: Alignment.center,
              backgroundColor:
                  WidgetStateProperty.all(color ?? AppColors.cPrimary),
              surfaceTintColor: WidgetStateProperty.all(
                color ?? Colors.transparent,
              ),
              foregroundColor: WidgetStateProperty.all(
                textColor ?? Colors.transparent,
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    radius,
                  ),
                ),
              ),
            ),
            onPressed: isLoading ? () {} : onPressed,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text.tr().toUpperCase(),
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                    ),
                  ),
                  if (rowWidget != null)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8),
                      child: rowWidget,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
