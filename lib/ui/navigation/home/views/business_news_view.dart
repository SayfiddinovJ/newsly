import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/ui/widgets/news_tile.dart';

class BusinessNewsView extends StatelessWidget {
  const BusinessNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == Status.error) {
          return Center(child: Text(state.error));
        } else {
          print(state.businessNews);
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return NewsTile(article: state.businessNews[index]);
            },
          );
        }
      },
    );
  }
}
