import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news_bloc.dart';
import 'package:newsly/data/models/form_status.dart';
import 'package:newsly/ui/route/app_route.dart';
import 'package:newsly/utils/extensions/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Newsly'), scrolledUnderElevation: 0),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == Status.error) {
            return Center(child: Text(state.error));
          } else {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.news[index].title, maxLines: 1),
                  subtitle: Text(
                    state.news[index].description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Text(
                    formatDateTime(state.news[index].publishedAt),
                    maxLines: 2,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.newsDetail,
                      arguments: state.news[index],
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
