import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  final String? title;
  final String? imageUrl;

  const ArticleEntity({required this.title,required this.imageUrl});

  @override
  List<Object?> get props => [title,imageUrl];
}