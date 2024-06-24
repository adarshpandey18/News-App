import 'package:news_app/models/everything_news_model.dart';
import 'package:news_app/repository/everything_repository.dart';

class EverythingNewsViewModel {
  final String sources;
  late EverythingRepository rep;
  EverythingNewsViewModel({required this.sources}) {
    rep = EverythingRepository(sources: sources);
  }
  Future<EverythingNews> fetchEveryNewsFromSourceApi() async {
    final response = rep.fetchEveryNewsFromSourceApi();
    return response;
  }
}
