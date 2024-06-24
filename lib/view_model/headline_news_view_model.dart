import 'package:news_app/models/news_channel_headline.dart';
import 'package:news_app/repository/news%20_repository.dart';

class NewsViewModel {
  final String sources;
  late final NewsRepository _rep;
  NewsViewModel({required this.sources}) {
    _rep = NewsRepository(sources: sources);
  }
  Future<NewsChannelHeadline> fetchNewsChannelHeadlineApi() async {
    final response = await _rep.fetchNewsChannelHeadlineApi();
    return response;
  }
}
