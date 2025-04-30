import 'articles_model.dart';

class EverythingModel {
  final String status;
  final int totalResults;
  final List<ArticlesModel> articles;

  EverythingModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory EverythingModel.fromJson(Map<String, dynamic> json) {
    return EverythingModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: List<ArticlesModel>.from(
        json["articles"].map((x) => ArticlesModel.fromJson(x)),
      ),
    );
  }
}
