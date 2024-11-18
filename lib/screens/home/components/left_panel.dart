import 'package:construction_site_management/core/config/constants/app_strings.dart';
import 'package:construction_site_management/core/config/constants/numbers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../core/config/Colors/app_colors.dart';
import '../../../core/config/constants/app_assets.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Numbers.defaultPadding * 4,
                horizontal: Numbers.defaultPadding * 2,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.appIcon,
                    height: 70,
                  ),
                  Text(
                    AppStrings.appName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            DrawerTile(
              isSelected: true,
              svgPic: AppAssets.homeIcon,
              title: AppStrings.homePage,
              onTapAction: () {},
            ),
            const Divider(),
            DrawerTile(
              isSelected: false,
              svgPic: AppAssets.materialIcon,
              title: AppStrings.materialsPage,
              onTapAction: () {},
            ),
            const Divider(),
            DrawerTile(
              isSelected: false,
              svgPic: AppAssets.reportIcon,
              title: AppStrings.reportPage,
              onTapAction: () {},
            ),
            const Divider(),
            DrawerTile(
              isSelected: false,
              svgPic: AppAssets.calcLapIcon,
              title: AppStrings.calcLapPage,
              onTapAction: () {},
            ),
            const Divider(),
            DrawerTile(
              isSelected: false,
              svgPic: AppAssets.dashboardIcon,
              title: AppStrings.dashboardPage,
              onTapAction: () {},
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.onTapAction,
    required this.svgPic,
    required this.title,
    required this.isSelected,
  });

  final void Function() onTapAction;
  final bool isSelected;
  final String svgPic, title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // shape: isSelected?Border(left: BorderSide(width: 6,color: AppColors.primaryColor)):null,
      // selected: isSelected,
      // selectedTileColor: const Color(0xfff2fcf3),
      onTap: onTapAction,
      // selectedColor: const Color.fromARGB(255, 135, 231, 145),
      leading: SvgPicture.asset(
        svgPic,
        height: Numbers.defaultIconsHeight,
        // color: isSelected? const Color.fromARGB(255, 135, 231, 145):null,
      ),
      title: Text(
        title,
        style: const TextStyle(
          letterSpacing: 0,
        ),
      ),
      minTileHeight: 70,
    );
  }
}
