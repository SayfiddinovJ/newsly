import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsly/data/models/news/everything/everything_model.dart';
import 'package:newsly/data/models/universal_data.dart';
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
}
