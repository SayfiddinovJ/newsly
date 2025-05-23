import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news/news_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/ui/widgets/news_tile.dart';
import 'package:newsly/ui/widgets/shimmer.dart';

class HealthNewsView extends StatefulWidget {
  const HealthNewsView({super.key});

  @override
  State<HealthNewsView> createState() => _HealthNewsViewState();
}

class _HealthNewsViewState extends State<HealthNewsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ShimmerListTile();
            },
          );
        } else if (state.status == Status.error) {
          return Center(child: Text(state.error));
        } else {
          return ListView.builder(
            itemCount: state.healthNews.length,
            itemBuilder: (context, index) {
              return NewsTile(
                article: state.healthNews[index],
                isBookmark: false,
              );
            },
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
