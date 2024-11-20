import 'package:construction_site_management/core/config/Colors/app_colors.dart';
import 'package:construction_site_management/core/config/constants/app_strings.dart';
import 'package:flutter/material.dart';

class Header2 extends StatelessWidget {
  const Header2({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.sites,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        const Spacer(),
        MaterialButton(
          onPressed: onPressed,
          height: 40,
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
    );
  }
}
