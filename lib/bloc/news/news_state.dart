part of 'news_bloc.dart';

final class NewsState {
  final List<ArticlesModel> news;
  final List<ArticlesModel> searchedNews;
  final List<ArticlesModel> businessNews;
  final List<ArticlesModel> techNews;
  final List<ArticlesModel> healthNews;
  final List<ArticlesModel> sportsNews;
  final String error;
  final Status status;
  final ArticlesModel article;

  const NewsState({
    required this.news,
    required this.searchedNews,
    required this.error,
    required this.status,
    required this.article,
    required this.businessNews,
    required this.techNews,
    required this.healthNews,
    required this.sportsNews,
  });

  NewsState copyWith({
    List<ArticlesModel>? news,
    List<ArticlesModel>? searchedNews,
    String? error,
    Status? status,
    ArticlesModel? article,
    List<ArticlesModel>? businessNews,
    List<ArticlesModel>? techNews,
    List<ArticlesModel>? healthNews,
    List<ArticlesModel>? sportsNews,
  }) {
    return NewsState(
      news: news ?? this.news,
      searchedNews: searchedNews ?? this.searchedNews,
      error: error ?? this.error,
      status: status ?? this.status,
      article: article ?? this.article,
      businessNews: businessNews ?? this.businessNews,
      techNews: techNews ?? this.techNews,
      healthNews: healthNews ?? this.healthNews,
      sportsNews: sportsNews ?? this.sportsNews,
    );
  }
}
