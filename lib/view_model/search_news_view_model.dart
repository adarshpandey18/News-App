import 'package:news_app/models/search_news_model.dart';
import 'package:news_app/repository/search_repository.dart';

class SearchNewsViewModel {
  final String search;
  late SearchRepository rep;
  SearchNewsViewModel({required this.search}) {
    rep = SearchRepository(search: search);
  }
  Future<SearchModel> fetchSearchNewsApi() async {
    final response = rep.fetchSearchNewsApi();
    return response;
  }
}
