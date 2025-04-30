import 'package:flutter/material.dart';
import 'package:newsly/ui/navigation/bottom_navigation.dart';
import 'package:newsly/ui/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String tabBox = "/tab_box";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );
      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text("Route not found!"))),
        );
    }
  }
}
