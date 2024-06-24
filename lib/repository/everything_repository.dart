import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/secrets/secrets.dart';
import 'package:news_app/models/everything_news_model.dart';

class EverythingRepository {
  final String sources;
  EverythingRepository({required this.sources});
  Future<EverythingNews> fetchEveryNewsFromSourceApi() async {
    final url =
        "https://newsapi.org/v2/everything?sources=$sources&apiKey=$keyAPI";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return EverythingNews.fromJson(body);
      } else {
        throw Exception(
            "Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load news.");
    }
  }
}
