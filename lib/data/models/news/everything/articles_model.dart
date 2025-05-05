class ArticleModelFields {
  static const String id = "_id";
  static const String sourceName = "source_name";
  static const String author = "author";
  static const String title = "title";
  static const String description = "description";
  static const String url = "url";
  static const String urlToImage = "url_to_image";
  static const String publishedAt = "published_at";
  static const String content = "content";

  static const String dbTable = "article";
}

class ArticlesModel {
  int? id;
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticlesModel({
    this.id,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  ArticlesModel copyWith({
    int? id,
    String? sourceName,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return ArticlesModel(
      id: id ?? this.id,
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      sourceName: json['source']['name'] ?? '',
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ArticleModelFields.sourceName: sourceName,
      ArticleModelFields.author: author,
      ArticleModelFields.title: title,
      ArticleModelFields.description: description,
      ArticleModelFields.url: url,
      ArticleModelFields.urlToImage: urlToImage,
      ArticleModelFields.publishedAt: publishedAt,
      ArticleModelFields.content: content,
    };
  }
}
