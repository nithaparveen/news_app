import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/search_screen_controller.dart';
import '../widgets/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * .6,
                    child: TextField(maxLines: 6,
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff8c2f35), width: 1)),
                      ),
                    ),
                  ),
                   const SizedBox(
                   width: 8
                  ),
                  Expanded(
                    child: SizedBox(height: 40,width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.searchData(
                              searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Center(
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff8c2f35),)),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Provider.of<SearchScreenController>(context).isLoading ==
                        true
                    ? const Center(
                        child: CircularProgressIndicator()
                )
                    : ListView.separated(
                        itemBuilder: (context, index) => NewsCard(
                            title:
                                provider.newsModel?.articles?[index].title ?? "",
                            description:
                                provider.newsModel?.articles?[index].description ??
                                    "",
                            date:
                                provider.newsModel?.articles?[index].publishedAt,
                            imageUrl:
                                provider.newsModel?.articles?[index].urlToImage ??
                                    "",
                            contant: provider.newsModel?.articles?[index].content ??
                                "",
                            sourceName:
                                provider.newsModel?.articles?[index].source?.name ??
                                    "",
                            url: provider.newsModel?.articles?[index].url ?? ""),
                        separatorBuilder: (context, index) => const Divider(height: 20),
                        itemCount: provider.newsModel?.articles?.length ?? 0),
              )
            ],
          )),
    );
  }
}
