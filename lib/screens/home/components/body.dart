import 'package:construction_site_management/core/config/Colors/app_colors.dart';
import 'package:construction_site_management/core/config/constants/numbers.dart';
import 'package:construction_site_management/screens/home/components/left_panel.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants/app_strings.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LeftPanel(),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(
              left: Numbers.defaultPadding * 2,
              right: Numbers.defaultPadding * 2,
              top: Numbers.defaultPadding * 2,
            ),
            child: Column(
              children: [
                const Header(),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.sites,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      height: 40,
                      // padding: EdgeInsets.symmetric(
                      //   vertical: Numbers.defaultPadding * 2,
                      //   horizontal: Numbers.defaultPadding * 4,
                      // ),
                      minWidth: 150,
                      color: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        AppStrings.addSite,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.homePage,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        const Spacer(),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Sites",
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
