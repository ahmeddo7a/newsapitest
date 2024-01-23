import 'package:get_it/get_it.dart';
import 'package:newsapitest/search_news/data/data_source/news_data_source.dart';
import 'package:newsapitest/search_news/data/repository/news_repository.dart';
import 'package:newsapitest/search_news/domain/repository/base_news_repository.dart';
import 'package:newsapitest/search_news/domain/use_case/get_articles_use_case.dart';
import 'package:newsapitest/search_news/presentation/logic/news_cubit.dart';


final sl = GetIt.instance;
class ServiceLocator {
  void init() {
    sl.registerFactory(() => NewsCubit(sl()));



    sl.registerLazySingleton(() => GetArticlesUseCase(sl()));

    sl.registerLazySingleton<BaseNewsRepository>(() => NewsRepository(sl()));


    sl.registerLazySingleton<BaseNewsDataSource>(() => NewsDataSource());



  }
}