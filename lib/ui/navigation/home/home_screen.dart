import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/ui/navigation/home/views/all_news_view.dart';
import 'package:newsly/ui/navigation/home/views/business_news_view.dart';
import 'package:newsly/ui/navigation/home/views/health_news_view.dart';
import 'package:newsly/ui/navigation/home/views/sports_news_view.dart';
import 'package:newsly/ui/navigation/home/views/tech_news_view.dart';
import 'package:newsly/utils/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsly'),
        scrolledUnderElevation: 0,
        bottom: TabBar(
          indicatorColor: AppTheme.primaryColor,
          dividerHeight: 0,
          labelColor: AppTheme.primaryColor,
          labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.w),
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          splashBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          tabs: const <Widget>[
            Tab(text: 'All news'),
            Tab(text: 'Business'),
            Tab(text: 'Sport'),
            Tab(text: 'Tech'),
            Tab(text: 'Health'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          AllNewsView(),
          BusinessNewsView(),
          SportsNewsView(),
          TechNewsView(),
          HealthNewsView(),
        ],
      ),
    );
  }
}
