import 'package:flutter/material.dart';
import 'package:news_app/core/cateogries.dart';
import 'package:news_app/models/cateogory_news_model.dart';
import 'package:news_app/view_model/category_news_view_model.dart';
import 'package:news_app/widgets/category_tile.dart';
import 'package:news_app/widgets/loading.dart';
import 'package:news_app/widgets/news_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late CategoryNewsViewModel categoryNewsViewModel;

  @override
  void initState() {
    super.initState();
    categoryNewsViewModel = CategoryNewsViewModel(category: categories[0]);
  }

  void changeCategory(String category) {
    setState(() {
      categoryNewsViewModel = CategoryNewsViewModel(category: category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "CATEGORY",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CategoryTile(
                      text: categories[index],
                      onTap: () => changeCategory(categories[index]),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<CategoryNews>(
                future: categoryNewsViewModel.fetchNewsCategoryHeadlineApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Loading(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(
                      child: Text("No articles found."),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.sources!.length,
                      itemBuilder: (context, index) {
                        final article = snapshot.data!.sources![index];
                        return NewsTile(
                            newsHeadline: article.description.toString(),
                            source: article.name.toString());
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
