import 'package:dio/dio.dart';
import 'package:newsapitest/search_news/data/models/article_model.dart';
import 'package:newsapitest/search_news/domain/entities/article_entity.dart';

import '../../../core/error/error_model.dart';
import '../../../core/error/exception.dart';
import '../../../core/network_strings.dart';

abstract class BaseNewsDataSource {

  Future<List<ArticleEntity>> getArticles(String parameters);

}


class NewsDataSource extends BaseNewsDataSource{
  @override
  Future<List<ArticleEntity>> getArticles(String parameters) async{
    try {
      final response = await Dio().get(
          NetworkStrings.articlePath(parameters),
      );
      if (response.statusCode == 200) {
        return List<ArticleModel>.from(
            (response.data['articles'] as List)
                .map((e) => ArticleModel.fromJson(e)));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'Error'}));
  }

}