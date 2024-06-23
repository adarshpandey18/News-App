import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/sources.dart';
import 'package:news_app/models/news_channel_headline.dart';
import 'package:news_app/pages/more_information.dart';
import 'package:news_app/view_model/NewsViewMode.dart';
import 'package:news_app/widgets/drawer_tile.dart';
import 'package:news_app/widgets/heading.dart';
import 'package:news_app/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsViewModel newsViewModel;
  @override
  void initState() {
    super.initState();
    newsViewModel = NewsViewModel(sources: "bbc-news");
  }

  void changeSource(String newSource) {
    setState(() {
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
                Navigator.pushNamed(context, '/category_screen');
              },
              icon: const Icon(Icons.category)),
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
      body: FutureBuilder<NewsChannelHeadline>(
        future: newsViewModel.fetchNewsChannelHeadlineApi(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Loading(),
            );
          } else if (!snapshot.hasData ||
              snapshot.data!.articles == null ||
              snapshot.data!.articles!.isEmpty) {
            return const Center(
              child: Text("No articles found."),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  final article = snapshot.data!.articles![index];
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
            );
          }
        },
      ),
    );
  }
}
