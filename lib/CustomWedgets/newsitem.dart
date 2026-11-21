import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:full_application/Models/articlemodel.dart';
import 'package:full_application/Screens/articlesdetails.dart';

class Newsitem extends StatelessWidget 
{
  final ArticleModel article;
  Newsitem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Articlesdetails(article: article),
          ),
        );
      },
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              article.imageurl,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image),
            ),
            SizedBox(height: 20),
            Text(article.title),
            Text(article.description),
          ],
        ),
      ),
    );
  }
}
