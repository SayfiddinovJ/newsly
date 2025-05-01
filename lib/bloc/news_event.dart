part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class GetNewsEvent extends NewsEvent {}

class SearchNewsEvent extends NewsEvent {}

class BookmarkNewsEvent extends NewsEvent {}

class RemoveBookmarkNewsEvent extends NewsEvent {}

class GetBookmarkNewsEvent extends NewsEvent {}

class GetSearchNewsEvent extends NewsEvent {}

class GetEverythingNewsEvent extends NewsEvent {}

class GetTopHeadlinesNewsEvent extends NewsEvent {}

class GetSourcesNewsEvent extends NewsEvent {}

class GetCategoriesNewsEvent extends NewsEvent {}

class GetCategoryNewsEvent extends NewsEvent {}

class GetCountryNewsEvent extends NewsEvent {}
