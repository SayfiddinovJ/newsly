part of 'news_bloc.dart';

final class NewsState {
  final List<ArticlesModel> news;
  final String error;
  final Status status;
  final ArticlesModel article;

  const NewsState({
    required this.news,
    required this.error,
    required this.status,
    required this.article,
  });

  NewsState copyWith({
    List<ArticlesModel>? news,
    String? error,
    Status? status,
    ArticlesModel? article,
  }) {
    return NewsState(
      news: news ?? this.news,
      error: error ?? this.error,
      status: status ?? this.status,
      article: article ?? this.article,
    );
  }
}
