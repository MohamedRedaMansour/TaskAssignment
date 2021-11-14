// To parse this JSON data, do
//
//     final articlesModel = articlesModelFromJson(jsonString);

import 'dart:convert';

ArticlesModel articlesModelFromJson(String str) => ArticlesModel.fromJson(json.decode(str));

String articlesModelToJson(ArticlesModel data) => json.encode(data.toJson());

class ArticlesModel {
  ArticlesModel({
    this.status,
    this.source,
    this.sortBy,
    this.articles,
  });

  String? status;
  String? source;
  String? sortBy;
  List<Article>? articles;

  factory ArticlesModel.fromJson(Map<dynamic, dynamic> json) => ArticlesModel(
    status: json["status"],
    source: json["source"],
    sortBy: json["sortBy"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<dynamic, dynamic> toJson() => {
    "status": status,
    "source": source,
    "sortBy": sortBy,
    "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;

  factory Article.fromJson(Map<dynamic, dynamic> json) => Article(
    author: json["author"] == null ? null : json["author"] ?? "author name",
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],//DateTime.parse(json["publishedAt"])
  );

  Map<dynamic, dynamic> toJson() => {
    "author": author == null ? null : author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,//.toIso8601String()
  };
}
