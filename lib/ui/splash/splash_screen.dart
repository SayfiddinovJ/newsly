import 'package:flutter/material.dart';
import 'package:newsly/ui/route/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [FlutterLogo(), Text('Splash Screen')],
        ),
      ),
    );
  }

  navigate(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
      }
    });
  }
}
