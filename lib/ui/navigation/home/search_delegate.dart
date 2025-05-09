import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/bloc/news_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/ui/widgets/news_tile.dart';
import 'package:newsly/ui/widgets/shimmer.dart';
import 'package:newsly/utils/theme/app_theme.dart';

class ProductSearchDelegate extends SearchDelegate {
  ProductSearchDelegate() : super(searchFieldLabel: "Search...");

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppTheme.primaryColor,
        scrolledUnderElevation: 0,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showResults(context);
        },
      ),
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ShimmerListTile();
              },
            );
          }
          if (state.status == Status.error) {
            return Center(child: Text("Error: ${state.error}"));
          }
          if (state.searchedNews.isEmpty) {
            return Center(child: Text("Nothing found!"));
          }
          return ColoredBox(
            color: AppTheme.primaryColor,
            child: ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return NewsTile(article: state.news[index]);
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ColoredBox(
      color: AppTheme.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 100.h),
              Text(
                'What news are you looking for today?',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
