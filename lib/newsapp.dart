// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'newsmodel.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});
  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<model> fetchNews() async {
    final url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-09-13&sortBy=publishedAt&apiKey=1f4dda100e6c4f10803ef8fc37b66486';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return model.fromJson(result);
    } else {
      return model();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    var data2 = snapshot
                        .data!.articles![index];

                    Navigator.push(context,MaterialPageRoute(builder: (context) => Detailpage(imgaddress: data2.urlToImage.toString(), title: data2.title.toString(), desc: data2.description.toString())));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: snapshot
                                  .data!.articles![index].urlToImage.toString() !=
                              null
                          ? NetworkImage(
                              snapshot.data!.articles![index].urlToImage.toString())
                          : const NetworkImage(
                              "https://portal.staralliance.com/cms/aux-pictures/prototype-images/avatar-default.png/@@images/image.png"),
                    ),
                    title: snapshot.data!.articles![index].title.toString() != null
                        ? Text(snapshot.data!.articles![index].title.toString())
                        : const Text("Data Not Found!!"),
                    subtitle: snapshot.data!.articles![index].description.toString() != null
                        ? Text(snapshot.data!.articles![index].description.toString())
                        : const Text("Description Not Found"),
                  ),
                );
              },
              itemCount: snapshot
                  .data!.articles!.length,
            );
          }),
    );
  }
}
