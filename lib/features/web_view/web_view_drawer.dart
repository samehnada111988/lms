import 'package:almohagerlms/config/themes/styles.dart';
import 'package:almohagerlms/core/components/widgets.dart';
import 'package:almohagerlms/core/utils/app_const.dart';
import 'package:almohagerlms/core/utils/app_sizes.dart';
import 'package:almohagerlms/features/web_view/web_view_shared.dart';
import 'package:almohagerlms/features/web_view/widgets/drawer_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WebViewDrawer extends StatelessWidget {
  const WebViewDrawer({
    super.key,
    required this.currentUrl,
  });

  final String currentUrl;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: AppPadding.mediumPadding,
                  ),
                  child: AppLogo(size: 34),
                ),
                CloseButton(
                  color: Colors.white,
                  onPressed: () =>
                      scaffoldKeyShared.currentState!.openEndDrawer(),
                ),
              ],
            ),
            const SizedBox(
              height: AppPadding.largePadding,
            ),
            DrawerListTile(
              title: 'main_page',
              icon: Icons.home_outlined,
              isSelected: currentUrl == AppConst.webUrl,
              url: AppConst.webUrl,
            ),

            /// profile page
            // DrawerListTile(
            //   title: 'profile_page',
            //   icon: Icons.person_outline,
            //   isSelected: currentUrl == AppConst.myAccountUrl,
            //   url: AppConst.myAccountUrl,
            // ),

            /// my courses page
            DrawerListTile(
              title: 'my_courses',
              icon: Icons.video_library_outlined,
              isSelected: currentUrl == AppConst.myCoursesUrl,
              url: AppConst.myCoursesUrl,
            ),

            /// courses page
            DrawerListTile(
              title: 'education_courses',
              icon: Icons.collections_bookmark_outlined,
              isSelected: currentUrl == AppConst.coursesUrl,
              url: AppConst.coursesUrl,
            ),

            /// instructors page
            DrawerListTile(
              title: 'instructors',
              icon: Icons.people_outline,
              isSelected: currentUrl == AppConst.instructorsUrl,
              url: AppConst.instructorsUrl,
            ),

            /// electronic exams page
            DrawerListTile(
              title: 'electronic_exams',
              icon: Icons.assignment_outlined,
              isSelected: currentUrl == AppConst.examsUrl,
              url: AppConst.examsUrl,
            ),

            /// exams results page
            DrawerListTile(
              title: 'exams_results',
              icon: Icons.workspace_premium_outlined,
              isSelected: currentUrl == AppConst.examsResultsUrl,
              url: AppConst.examsResultsUrl,
            ),

            /// wallet page
            if (AppConst.showBalance)
              DrawerListTile(
                title: 'wallet',
                icon: Icons.account_balance_wallet_outlined,
                isSelected: currentUrl == AppConst.walletUrl,
                url: AppConst.walletUrl,
              ),

            const Divider(),

            /// about platform page
            DrawerListTile(
              title: 'about_platform',
              icon: Icons.info_outline,
              url: AppConst.aboutUs,
              isSelected: currentUrl == AppConst.aboutUs,
            ),

            /// help page
            DrawerListTile(
              title: 'help',
              icon: Icons.help_outline,
              isSelected: currentUrl == AppConst.help,
              url: AppConst.help,
            ),

            const SizedBox(height: AppPadding.mediumPadding),
            const Divider(),
            const SizedBox(height: AppPadding.mediumPadding),

            Text(
              '${'all_copy_rights_saved'.tr()} © 2024',
              textAlign: TextAlign.center,
              style: AppStyles.subtitle600,
            ),
          ],
        ),
      ),
    );
  }
}
