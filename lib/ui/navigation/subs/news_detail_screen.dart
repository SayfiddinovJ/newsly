import 'package:flutter/material.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.article});

  final ArticlesModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Newsly'), scrolledUnderElevation: 0),
      body: Column(children: [Text(article.title)]),
    );
  }
}
