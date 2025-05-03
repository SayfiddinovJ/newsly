import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/ui/navigation/home/views/all_news_view.dart';

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
          Center(child: Text('Business')),
          Center(child: Text('Sport')),
          Center(child: Text('Tech')),
          Center(child: Text('Health')),
        ],
      ),
    );
  }
}
