part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsFirstListSuccess extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsSecondListSuccess extends NewsState {
  @override
  List<Object> get props => [];
}
