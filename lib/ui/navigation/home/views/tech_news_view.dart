import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/ui/widgets/news_tile.dart';
import 'package:newsly/utils/theme/app_theme.dart';

class TechNewsView extends StatefulWidget {
  const TechNewsView({super.key});

  @override
  State<TechNewsView> createState() => _TechNewsViewState();
}

class _TechNewsViewState extends State<TechNewsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == Status.error) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(color: AppTheme.primaryColor),
            ),
          );
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

  @override
  bool get wantKeepAlive => true;
}
