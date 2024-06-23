import 'package:news_app/models/cateogory_news_model.dart';
import 'package:news_app/repository/categories_repository.dart';

class CategoryNewsViewModel {
  final String category;
  late final CategoriesRepository _rep;
  CategoryNewsViewModel({required this.category}) {
    _rep = CategoriesRepository(category: category);
  }
  Future<CategoryNews> fetchNewsCategoryHeadlineApi() async {
    final response = await _rep.fetchNewsCategoryHeadlineApi();
    return response;
  }
}
