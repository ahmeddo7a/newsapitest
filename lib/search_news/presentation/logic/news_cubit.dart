import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/use_case/get_articles_use_case.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {

  GetArticlesUseCase getArticlesUseCase;
  NewsCubit(this.getArticlesUseCase) : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);


   List<ArticleEntity> finalArticleList=[];
   List<ArticleEntity> firstArticlesList=[];
  void getFirstArticles({required String value}) async{
    emit(NewsInitial());
    if(value.isNotEmpty){
      final result = await getArticlesUseCase(value);
      result.fold((l) => showToast(type: ToastTypes.ERROR,text: l.message), (r) {
        firstArticlesList = r;
        if(secondArticlesList.isEmpty){
          finalArticleList = firstArticlesList;
        } else{
          finalArticleList.addAll(firstArticlesList);
            finalArticleList.replaceRange(0, 2, firstArticlesList);
          finalArticleList.removeRange(finalArticleList.length-4, finalArticleList.length);

        }
        emit(NewsFirstListSuccess());
      });
    } else {
      finalArticleList.removeRange(0, 3);
      emit(NewsFirstListSuccess());
    }
  }

  List<ArticleEntity> secondArticlesList = [];
  void getSecondArticles({required String value}) async{
    emit(NewsInitial());
    if(value.isNotEmpty){
      final result = await getArticlesUseCase(value);
      result.fold((l) => showToast(type: ToastTypes.ERROR,text: l.message), (r) {
        secondArticlesList = r;
        if(firstArticlesList.isEmpty){
          finalArticleList = secondArticlesList;
        }else {
          finalArticleList.addAll(secondArticlesList);
          finalArticleList.replaceRange(3, 5, secondArticlesList);
          finalArticleList.removeRange(6, finalArticleList.length);
        }
        emit(NewsSecondListSuccess());
      });
    } else {
      finalArticleList.removeRange(3, 6);
      emit(NewsSecondListSuccess());
    }
  }
}


