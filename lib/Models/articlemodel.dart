class ArticleModel {
  final String imageurl;
  final String title;
  final String description;
  final String author;
  final String publishdate;
  final String content;

  ArticleModel({
    required this.imageurl,
    required this.title,
    required this.description,
    required this.author,
    required this.publishdate,
    required this.content,
  });
}

class Articles {
  List<ArticleModel> articles;
  Articles({required this.articles});
  factory Articles.fromjson(Map<String, dynamic> json) {
    final templist = json["articles"]
        .map<ArticleModel>(
          (article) => ArticleModel(
            imageurl: article["urlToImage"] ?? "",
            title: article["title"],
            description: article["description"]??"",
            author: article["author"]??"",
            publishdate: article["publishedAt"]??"",
            content: article["content"]??"",
          ),
        )
        .toList();
    return Articles(articles: templist);
  }
}
