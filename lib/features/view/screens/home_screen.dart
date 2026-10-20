import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/model/news_model.dart';
import 'package:news_app/features/logic/cubit/news_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: AppBar(
        backgroundColor: const Color(0xff1877F2),
        title: const Text(
          'News',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff1877F2),
              ),
            );
          }

          if (state is NewsFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.redAccent,
                      size: 45,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.error,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<NewsCubit>().getNews();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is NewsSuccess) {
            final List<Articles> articles =
                state.news.articles ?? [];

            if (articles.isEmpty) {
              return const Center(
                child: Text(
                  'No news available.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];

                final String articleImage =
                    article.urlToImage ?? '';

                final String articleTitle =
                    article.title ?? 'No title available';

                final String articleCategory =
                    article.source?.name ?? 'News';

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.details,
                      arguments: <String, String>{
                        'image': articleImage,
                        'title': articleTitle,
                        'category': articleCategory,
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: articleImage.isNotEmpty
                              ? Image.network(
                                  articleImage,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return _imagePlaceholder();
                                  },
                                )
                              : _imagePlaceholder(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          articleCategory,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffB0B3B8),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          articleTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffE4E6EB),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff1877F2),
            ),
          );
        },
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 200,
      color: const Color(0xff303030),
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: Colors.white54,
        size: 45,
      ),
    );
  }
}