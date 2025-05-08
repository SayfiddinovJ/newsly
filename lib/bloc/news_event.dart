part of 'news_bloc.dart';

sealed class NewsEvent {}

class GetNewsEvent extends NewsEvent {}

class RemoveBookmarkNewsEvent extends NewsEvent {}

class GetBookmarkNewsEvent extends NewsEvent {}

class SearchNewsEvent extends NewsEvent {
  final String query;
  final String date;

  SearchNewsEvent({required this.query, required this.date});
}

class GetEverythingNewsEvent extends NewsEvent {}
