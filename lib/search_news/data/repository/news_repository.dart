import 'package:dartz/dartz.dart';
import 'package:newsapitest/core/error/failure.dart';
import 'package:newsapitest/search_news/data/data_source/news_data_source.dart';
import 'package:newsapitest/search_news/domain/entities/article_entity.dart';
import 'package:newsapitest/search_news/domain/repository/base_news_repository.dart';

import '../../../core/error/exception.dart';

class NewsRepository extends BaseNewsRepository{
  BaseNewsDataSource baseNewsDataSource;
  NewsRepository(this.baseNewsDataSource);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getNews(String parameters) async{
    try {
      final result =  await baseNewsDataSource.getArticles(parameters);
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }
}