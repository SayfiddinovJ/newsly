import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/utils/extensions/extensions.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.article});

  final ArticlesModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(imageUrl: article.urlToImage),
          ),
          Text('Title: ${article.title}'),
          Text('Content: ${article.content}'),
          Text('Description: ${article.description}'),
          Text('Author: ${article.author}'),
          Text('Published at: ${formatDateTime(article.publishedAt)}'),
          Text('Url: ${article.url}'),
          Text('Source name: ${article.sourceName}'),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'share',
              onPressed: () {
                // Share action
              },
              tooltip: 'Share',
              child: Icon(Icons.share),
            ),
            Spacer(),
            FloatingActionButton(
              heroTag: 'open_chrome',
              onPressed: () {
                // Open in Chrome action
              },
              tooltip: 'Open in Chrome',
              child: Icon(Icons.open_in_browser),
            ),
          ],
        ),
      ),
    );
  }
}
