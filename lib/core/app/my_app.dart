import 'package:construction_site_management/core/routes/routes.dart';
import 'package:construction_site_management/core/themes/my_theme.dart';
import 'package:construction_site_management/core/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Construction Site Management',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: Routes.homeScreenRouteName,
      getPages: Routes.routes,
    );
  }
}