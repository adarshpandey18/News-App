import 'package:flutter/material.dart';
import 'package:news_app/models/news_channel_headline.dart';
import 'package:news_app/view_model/NewsViewMode.dart';
import 'package:news_app/widgets/heading.dart';
import 'package:news_app/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
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
      drawer: const Drawer(),
      body: FutureBuilder<NewsChannelHeadline>(
          future: newsViewModel.fetchNewsChannelHeadlineApi(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Loading(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.articles!.length,
                  itemBuilder: (context, index) {
                    return Heading(
                      imageUrl:
                          snapshot.data!.articles![index].urlToImage.toString(),
                      title: snapshot.data!.articles![index].title.toString(),
                      source: snapshot.data!.articles![index].source!.name
                          .toString(),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
