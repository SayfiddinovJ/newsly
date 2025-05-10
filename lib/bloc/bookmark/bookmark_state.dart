part of 'bookmark_bloc.dart';

final class BookmarkState {
  final List<ArticlesModel> news;
  final String error;
  final Status status;
  final ArticlesModel article;

  const BookmarkState({
    required this.news,
    required this.error,
    required this.status,
    required this.article,
  });

  BookmarkState copyWith({
    String? error,
    Status? status,
    ArticlesModel? article,
    List<ArticlesModel>? news,
  }) {
    return BookmarkState(
      news: news ?? this.news,
      error: error ?? this.error,
      status: status ?? this.status,
      article: article ?? this.article,
    );
  }
}
