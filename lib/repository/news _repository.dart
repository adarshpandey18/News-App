import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_channel_headline.dart';

class NewsRepository {
  Future<NewsChannelHeadline> fetchNewsChannelHeadlineApi() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=fa945be08acd4e7493d48e7e02d6a86f";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return NewsChannelHeadline.fromJson(body);
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception("Failed to load news");
    }
  }
}
