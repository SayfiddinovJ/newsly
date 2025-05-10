import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/bookmark/bookmark_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/ui/widgets/news_tile.dart';
import 'package:newsly/ui/widgets/shimmer.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Newsly'), scrolledUnderElevation: 0),
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
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
            return state.news.isEmpty
                ? Center(child: Text('No Bookmarks yet'))
                : ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                      article: state.news[index],
                      isBookmark: true,
                    );
                  },
                );
          }
        },
      ),
    );
  }
}
