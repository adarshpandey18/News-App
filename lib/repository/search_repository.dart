import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/secrets/secrets.dart';
import 'package:news_app/models/search_news_model.dart';

class SearchRepository {
  final String search;
  SearchRepository({required this.search});
  Future<SearchModel> fetchSearchNewsApi() async {
    String url = 'https://newsapi.org/v2/everything?q=$search&apiKey=$keyAPI';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return SearchModel.fromJson(body);
      } else {
        throw Exception(
            "Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load news.");
    }
  }
}
