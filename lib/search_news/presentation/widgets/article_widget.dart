import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapitest/search_news/domain/entities/article_entity.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity article;
  const ArticleWidget({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.sizeOf(context).width;
    final myHeight = MediaQuery.sizeOf(context).height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
            width: myWidth*0.3,
            height: myHeight*0.1,
            imageUrl: article.imageUrl!,
            fit: BoxFit.contain,

        ),
        SizedBox(width: myWidth*0.02,),
        Expanded(child: Text(article.title!,overflow: TextOverflow.ellipsis,))
      ],
    );
  }
}
