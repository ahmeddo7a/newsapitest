import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapitest/search_news/presentation/logic/news_cubit.dart';
import 'package:newsapitest/search_news/presentation/widgets/article_widget.dart';

import '../../../core/services/service_locator.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;

    return BlocProvider(
      create: (context) => sl<NewsCubit>(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          final cubit = NewsCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.1),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: 'First Search'),
                    onChanged: (dynamic value) {
                      cubit.getFirstArticles(value: value);
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Second Search'),
                    onChanged: (dynamic value) {
                      cubit.getSecondArticles(value: value);
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.05,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            ArticleWidget(article: cubit.finalArticleList[index]),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cubit.finalArticleList.length),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
