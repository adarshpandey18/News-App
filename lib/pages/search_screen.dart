import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/pages/more_information.dart';
import 'package:news_app/view_model/search_news_view_model.dart';
import 'package:news_app/widgets/every_news_tile.dart';
import 'package:news_app/widgets/loading.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchNewsViewModel searchNewsViewModel;
  @override
  void initState() {
    super.initState();
    searchNewsViewModel = SearchNewsViewModel(search: 'adarsh');
  }

  void onTap({
    required imageUrl,
    required String source,
    required String date,
    required String description,
    required String content,
    required String url,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoreInformation(
          imageUrl: imageUrl,
          source: source,
          date: date,
          description: description,
          content: content,
          url: url,
        ),
      ),
    );
  }

  TextEditingController? search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SEARCH",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      labelText: "Enter keyword to search",
                    ),
                    controller: search,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.black,
                    iconColor: Colors.white,
                  ),
                  onPressed: () => setState(
                    () {
                      final keyword = search?.text;
                      if (keyword!.isNotEmpty) {
                        searchNewsViewModel =
                            SearchNewsViewModel(search: keyword.toString());
                      }
                    },
                  ),
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: searchNewsViewModel.fetchSearchNewsApi(),
                  builder: (builder, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Loading());
                  }
                    else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else if (!snapshot.hasData ||
                        snapshot.data!.articles == null ||
                        snapshot.data!.articles!.isEmpty) {
                      return const Center(
                        child: Text("No articles found"),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          final article = snapshot.data!.articles![index];
                          return (snapshot.data!.articles![index].title != '[Removed]') ?EveryNewsTile(
                            url: article.urlToImage ?? '',
                            description: article.description ?? '',
                            content: article.content ?? '',
                            onTap: () => onTap(
                                url: article.url ?? '',
                                imageUrl: article.urlToImage,
                                source: article.source!.name ?? '',
                                description: article.description ?? '',
                                content: article.content ?? '',
                                date: ''),
                          ) :  const SizedBox.shrink();
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
