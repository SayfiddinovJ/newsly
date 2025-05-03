import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/data/universal_data.dart';
import 'package:newsly/repositories/repository.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository)
    : super(
        NewsState(
          news: [],
          error: '',
          status: Status.pure,
          article: ArticlesModel(
            sourceName: '',
            author: '',
            title: '',
            description: '',
            url: '',
            urlToImage: '',
            publishedAt: '',
            content: '',
          ),
        ),
      ) {
    on<NewsEvent>((event, emit) {});
    on<GetEverythingNewsEvent>(addProduct);
  }

  Future<void> addProduct(
    GetEverythingNewsEvent getEverythingNewsEvent,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData data = await newsRepository.getNews();
    emit(state.copyWith(status: Status.loaded));
    if (data.error.isEmpty) {
      emit(state.copyWith(status: Status.success, news: data.data!.articles));
    } else {
      emit(state.copyWith(status: Status.error, error: data.error));
    }
  }
}
