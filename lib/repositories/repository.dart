import 'package:newsly/data/local/sqflite.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/data/universal_data.dart';
import 'package:newsly/service/api_service.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<UniversalData> getNews() => apiService.getEveryThing();

  Future<UniversalData> getBusinessNews(String source) =>
      apiService.getByCategory(source);

  Future<UniversalData> getTechNews(String source) =>
      apiService.getByCategory(source);

  Future<UniversalData> getSportsNews(String source) =>
      apiService.getByCategory(source);

  Future<UniversalData> getHealthNews(String source) =>
      apiService.getByCategory(source);

  Future<UniversalData> search(String query, String date) =>
      apiService.search(query, date);

  Future<ArticlesModel> addBookmark(ArticlesModel articleModel) =>
      LocalDatabase.insert(articleModel);

  Future<UniversalData> remove(String id) =>
      LocalDatabase.delete(int.parse(id));

  Future<List<ArticlesModel>> getBookmarks() => LocalDatabase.getAll();
}
