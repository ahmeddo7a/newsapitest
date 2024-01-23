import 'package:newsapitest/search_news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity{
  const ArticleModel({ super.title,  super.imageUrl});

  factory ArticleModel.fromJson(Map<String,dynamic> json) =>ArticleModel(
      title:  (json['title'] != null) ? json['title'] : 'empty',
      imageUrl: (json['title'] != null) ? json['urlToImage'] : 'empty'
  );
}