import 'package:dartz/dartz.dart';
import 'package:newsapitest/search_news/domain/entities/article_entity.dart';

import '../../../core/error/failure.dart';

abstract class BaseNewsRepository{
  Future<Either<Failure,List<ArticleEntity>>> getNews(String parameters);

}