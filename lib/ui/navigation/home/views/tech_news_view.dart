import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/ui/widgets/news_tile.dart';

class TechNewsView extends StatelessWidget {
  const TechNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == Status.error) {
          return Center(child: Text(state.error));
        } else {
          return ListView.builder(
            itemCount: state.techNews.length,
            itemBuilder: (context, index) {
              return NewsTile(article: state.techNews[index]);
            },
          );
        }
      },
    );
  }
}
