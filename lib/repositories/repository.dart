import 'package:newsly/data/models/universal_data.dart';
import 'package:newsly/service/api_service.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<UniversalData> getNews() async {
    return await apiService.getEveryThing();
  }
}
