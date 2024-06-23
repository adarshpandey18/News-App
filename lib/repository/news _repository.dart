import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_channel_headline.dart';
import 'package:news_app/core/secrets/secrets.dart';

class NewsRepository {
  final String sources;

  NewsRepository({required this.sources});

  Future<NewsChannelHeadline> fetchNewsChannelHeadlineApi() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=$sources&apiKey=$keyAPI";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return NewsChannelHeadline.fromJson(body);
      } else {
        throw Exception(
            "Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching news: $e");
      }
      throw Exception("Failed to load news");
    }
  }
}
