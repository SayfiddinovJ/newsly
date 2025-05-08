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
}
