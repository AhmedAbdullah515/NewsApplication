import 'package:flutter/material.dart';
import 'package:full_application/Models/articlemodel.dart';

class Articlesdetails extends StatelessWidget {
  final ArticleModel article;
  Articlesdetails({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Image.network(article.imageurl),
                SizedBox(height: 20),
                Text(article.title),
                SizedBox(height: 20),

                Text(article.description),
                SizedBox(height: 20),

                Text(article.author),
                SizedBox(height: 20),

                Text(article.content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
