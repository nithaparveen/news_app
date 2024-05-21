import 'package:flutter/material.dart';
import 'package:newsapp/controller/home_screen_controller.dart';
import 'package:newsapp/view/search_screen/search_screen.dart';
import 'package:newsapp/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff8c2f35),
          elevation: 0,
          centerTitle: true,
          title: const Text('News24'),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          actions: [
            IconButton(color: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SearchScreen()));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Provider.of<HomeScreenController>(context).isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                          title: provider.newsModel.articles?[index].title
                                  .toString() ??
                              "",
                          description: provider
                                  .newsModel.articles?[index].description
                                  .toString() ??
                              "",
                          date: provider.newsModel.articles?[index].publishedAt,
                          imageUrl: provider
                                  .newsModel.articles?[index].urlToImage
                                  .toString() ??
                              "",
                          contant: provider.newsModel.articles?[index].content
                                  .toString() ??
                              "",
                          sourceName: provider
                                  .newsModel.articles?[index].source?.name
                                  .toString() ??
                              "",
                          url: provider.newsModel.articles?[index].url
                                  .toString() ??
                              "",
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          height: 10,
                        ),
                    itemCount: provider.newsModel.articles?.length ?? 0),
              ));
  }
}
