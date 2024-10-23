import 'package:almohagerlms/config/themes/colors.dart';
import 'package:almohagerlms/core/utils/app_sizes.dart';
import 'package:almohagerlms/features/web_view/web_view_shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.url,
    this.isSelected = false,
    this.onTap,
    this.imageAsset,
    this.trailing,
  });

  final String title;
  final IconData? icon;
  final Widget? trailing;
  final String? imageAsset;

  final bool isSelected;

  final String? url;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: AppPadding.mediumPadding,
      ),
      child: ListTile(
        selected: isSelected,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.largePadding,
        ),
        selectedColor: Theme.of(context).textTheme.bodyLarge!.color,

        /// replace this
        selectedTileColor: AppColors.cTextSubtitleLight.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.mediumRadius),
        ),
        leading: imageAsset != null
            ? Image.asset(
                imageAsset!,
                width: 20,
                height: 20,
              )
            : Icon(
                icon,
                color: Colors.white,
              ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: AppFontSize.f16,
            color: Colors.white,
          ),
        ).tr(),
        trailing: trailing,
        onTap: onTap ??
            () async {
              if (url == null) return;
              webViewControllerShared!.loadUrl(
                urlRequest: URLRequest(
                  url: WebUri(url!),
                ),
              );
              scaffoldKeyShared.currentState!.openEndDrawer();
              // Navigator.pop(context);
            },
      ),
    );
  }
}
