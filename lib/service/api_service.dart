import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsly/data/models/news/everything/everything_model.dart';
import 'package:newsly/data/universal_data.dart';
import 'package:newsly/utils/constants/constants.dart';

class ApiService {
  Future<UniversalData> getEveryThing() async {
    try {
      Uri url = Uri.parse('$baseUrl/everything?q=News&apiKey=$apiKey');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return UniversalData(
          data: EverythingModel.fromJson(jsonDecode(response.body)),
        );
      } else {
        return UniversalData(error: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getByCategory(String category) async {
    try {
      Uri url = Uri.parse(
        '$baseUrl/top-headlines?category=$category&apiKey=$apiKey',
      );
      http.Response response = await http
          .get(url)
          .timeout(const Duration(seconds: 40));
      if (response.statusCode == 200) {
        return UniversalData(
          data: EverythingModel.fromJson(jsonDecode(response.body)),
        );
      } else {
        return UniversalData(error: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> search(String query, String date) async {
    try {
      Uri url = Uri.parse(
        '$baseUrl/everything?q=$query&from=$date&sortBy=publishedAt&apiKey=$apiKey',
      );
      http.Response response = await http
          .get(url)
          .timeout(const Duration(seconds: 40));
      if (response.statusCode == 200) {
        return UniversalData(
          data: EverythingModel.fromJson(jsonDecode(response.body)),
        );
      } else {
        return UniversalData(error: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}
