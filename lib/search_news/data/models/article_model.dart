import 'package:newsapitest/search_news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity{
  const ArticleModel({required super.title, required super.imageUrl});

  factory ArticleModel.fromJson(Map<String,dynamic> json) =>ArticleModel(
      title: json['title'],
      imageUrl: json['urlToImage']
  );
}