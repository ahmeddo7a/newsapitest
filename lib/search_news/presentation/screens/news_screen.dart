import 'package:flutter/material.dart';
import 'package:newsapitest/search_news/domain/entities/article_entity.dart';
import 'package:newsapitest/search_news/presentation/widgets/article_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    const List<ArticleEntity> articles =  [ArticleEntity(title: 'José Murat: Desigualdad social al alza en el mundo', imageUrl: 'https://cdn08.allafrica.com/static/images/structure/aa-logo-rgba-no-text-square.png'),
      ArticleEntity(title: 'José Murat: Desigualdad social al alza en el mundo', imageUrl: 'https://cdn08.allafrica.com/static/images/structure/aa-logo-rgba-no-text-square.png')
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: myWidth * 0.05, vertical: myHeight * 0.1),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'First Search'
              ),
              onChanged: (dynamic value) {},
            ),
            SizedBox(
              height: myHeight * 0.02,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Second Search'
              ),
              onChanged: (dynamic value) {},
            ),
            SizedBox(
              height: myHeight * 0.05,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ArticleWidget(article: articles[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: articles.length),
            )
          ],
        ),
      ),
    );
  }
}
