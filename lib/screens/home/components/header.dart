import 'package:construction_site_management/core/config/constants/app_strings.dart';
import 'package:flutter/material.dart';

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
