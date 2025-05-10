part of 'news_bloc.dart';

sealed class NewsEvent {}

class GetNewsEvent extends NewsEvent {}

class SearchNewsEvent extends NewsEvent {
  final String query;
  final String date;

  SearchNewsEvent({required this.query, required this.date});
}

class GetEverythingNewsEvent extends NewsEvent {}

class AddBookmarkEvent extends NewsEvent {
  final ArticlesModel article;

  AddBookmarkEvent({required this.article});
}
