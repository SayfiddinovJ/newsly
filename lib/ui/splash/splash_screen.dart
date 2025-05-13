import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/bloc/bookmark/bookmark_bloc.dart';
import 'package:newsly/bloc/news/news_bloc.dart';
import 'package:newsly/ui/route/app_route.dart';
import 'package:newsly/utils/extensions/extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/icon.png', width: 150.w, height: 150.w),
              5.ph,
              Text(
                'Newsly',
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigate(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (context.mounted) {
        context.read<NewsBloc>().add(GetEverythingNewsEvent());
        context.read<BookmarkBloc>().add(GetBookmarkNewsEvent());
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
      }
    });
  }
}
