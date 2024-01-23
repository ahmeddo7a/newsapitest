import 'package:dartz/dartz.dart';
import 'package:newsapitest/search_news/domain/entities/article_entity.dart';

import '../../../core/basics/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../repository/base_news_repository.dart';

class GetArticlesUseCase extends BaseUseCase<List<ArticleEntity>,String>{
  BaseNewsRepository baseParentHomeRepository;
  GetArticlesUseCase(this.baseParentHomeRepository);

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(String parameters) async{
    return await baseParentHomeRepository.getNews(parameters);
  }

}