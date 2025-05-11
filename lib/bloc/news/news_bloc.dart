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
          searchedNews: [],
          businessNews: [],
          techNews: [],
          healthNews: [],
          sportsNews: [],
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
    on<GetEverythingNewsEvent>(get);
    on<SearchNewsEvent>(search);
    on<AddBookmarkEvent>(addBookmark);
  }

  Future<void> get(
    GetEverythingNewsEvent getEverythingNewsEvent,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData news = await newsRepository.getNews();
    UniversalData businessNews = await newsRepository.getBusinessNews(
      'Business',
    );
    UniversalData techNews = await newsRepository.getTechNews('Technology');
    UniversalData healthNews = await newsRepository.getHealthNews('Health');
    UniversalData sportsNews = await newsRepository.getSportsNews('Sports');
    emit(state.copyWith(status: Status.loaded));
    if (news.error.isEmpty &&
        businessNews.error.isEmpty &&
        techNews.error.isEmpty &&
        healthNews.error.isEmpty &&
        sportsNews.error.isEmpty) {
      emit(
        state.copyWith(
          status: Status.success,
          news: news.data.articles,
          businessNews: businessNews.data.articles,
          techNews: techNews.data.articles,
          healthNews: healthNews.data.articles,
          sportsNews: sportsNews.data.articles,
        ),
      );
    } else {
      emit(state.copyWith(status: Status.error, error: news.error));
    }
  }

  Future<void> search(
    SearchNewsEvent searchNewsEvent,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData news = await newsRepository.search(
      searchNewsEvent.query,
      searchNewsEvent.date,
    );
    emit(state.copyWith(status: Status.loaded));
    if (news.error.isEmpty) {
      emit(
        state.copyWith(
          status: Status.success,
          searchedNews: news.data.articles,
        ),
      );
    } else {
      emit(state.copyWith(status: Status.error, error: news.error));
    }
  }

  Future<void> addBookmark(
    AddBookmarkEvent addBookmarkEvent,
    Emitter<NewsState> emit,
  ) async {
    await newsRepository.addBookmark(addBookmarkEvent.article);
  }
}
