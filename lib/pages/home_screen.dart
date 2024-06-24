import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/sources.dart';
import 'package:news_app/models/everything_news_model.dart';
import 'package:news_app/models/news_channel_headline.dart';
import 'package:news_app/pages/more_information.dart';
import 'package:news_app/view_model/everything_news_view_model.dart';
import 'package:news_app/view_model/headline_news_view_model.dart';
import 'package:news_app/widgets/drawer_tile.dart';
import 'package:news_app/widgets/every_news_tile.dart';
import 'package:news_app/widgets/heading.dart';
import 'package:news_app/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsViewModel newsViewModel;
  late EverythingNewsViewModel everythingNewsViewModel;
  @override
  void initState() {
    super.initState();
    newsViewModel = NewsViewModel(sources: sourceValue.values.first);
    everythingNewsViewModel =
        EverythingNewsViewModel(sources: sourceValue.values.first);
  }

  void changeSource(String newSource) {
    setState(() {
      everythingNewsViewModel = EverythingNewsViewModel(sources: newSource);
      newsViewModel = NewsViewModel(sources: newSource);
      Navigator.pop(context);
    });
  }

  void onTap(
    String imageUrl,
    String source,
    String date,
    String description,
    String content,
    String url,
  ) {
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

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDateTime = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "NEWS",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search_screen');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/category_screen');
            },
            icon: const Icon(Icons.category),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.newspaper,
                size: 50,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: sourceValue.length,
                  itemBuilder: (context, index) {
                    return DrawerTile(
                        text: sourceValue.keys.elementAt(index),
                        function: () =>
                            changeSource(sourceValue.values.elementAt(index)));
                  }),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          newsViewModel.fetchNewsChannelHeadlineApi(),
          everythingNewsViewModel.fetchEveryNewsFromSourceApi(),
        ]),
        builder: (BuildContext context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Loading(),
            );
          } else if (!snapshot.hasData ||
        snapshot.data!.length < 2 ||
        snapshot.data![0] == null ||
        snapshot.data![1] == null) {
            return const Center(
              child: Text("No articles found."),
            );
          } else {
            NewsChannelHeadline? newsChannelData =
              snapshot.data![0] as NewsChannelHeadline;
          EverythingNews? everythingNewsData =
              snapshot.data![1] as EverythingNews;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsChannelData.articles!.length,
                      itemBuilder: (context, index) {
                        final article = newsChannelData.articles![index];
                        return Heading(
                          imageUrl: article.urlToImage ?? "",
                          title: article.title ?? "",
                          source: article.source?.name ?? "",
                          onTap: () => onTap(
                              article.urlToImage ?? "",
                              article.source?.name ?? "",
                              formatDateTime(
                                article.publishedAt.toString(),
                              ),
                              article.description.toString(),
                              article.content.toString(),
                              article.url ?? ""),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: everythingNewsData.articles!.length,
                      itemBuilder: (context, index) {
                        final article = everythingNewsData.articles![index];
                        return EveryNewsTile(
                          url: article.urlToImage ?? "",
                          description: article.description.toString(),
                          content: article.content.toString(),
                          onTap: () => onTap(
                              article.urlToImage ?? "",
                              article.source?.name ?? "",
                              formatDateTime(
                                article.publishedAt.toString(),
                              ),
                              article.description.toString(),
                              article.content.toString(),
                              article.url ?? ""),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
