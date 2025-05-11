import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/data/form_status.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/repositories/repository.dart';

part 'bookmark_event.dart';

part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final NewsRepository newsRepository;

  BookmarkBloc(this.newsRepository)
    : super(
        BookmarkState(
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
    on<BookmarkEvent>((event, emit) {});
    on<GetBookmarkNewsEvent>(get);
    on<RemoveBookmarkNewsEvent>(remove);
  }

  Future<void> get(
    GetBookmarkNewsEvent getEverythingNewsEvent,
    Emitter<BookmarkState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    List<ArticlesModel> news = await newsRepository.getBookmarks();
    emit(state.copyWith(status: Status.loaded));
    emit(state.copyWith(status: Status.success, news: news));
  }

  Future<void> remove(
    RemoveBookmarkNewsEvent removeBookmarkNewsEvent,
    Emitter<BookmarkState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    await newsRepository.remove(removeBookmarkNewsEvent.id);
    emit(state.copyWith(status: Status.loaded));
    emit(state.copyWith(status: Status.success));
  }
}
