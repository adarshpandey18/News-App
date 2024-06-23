import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/models/news_channel_headline.dart';
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
            DrawerTile(
                text: 'BCC News', function: () => changeSource('bbc-news')),
            DrawerTile(
                text: 'CBC News', function: () => changeSource('cbc-news')),
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
