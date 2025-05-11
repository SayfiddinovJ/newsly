part of 'bookmark_bloc.dart';

sealed class BookmarkEvent {}

class RemoveBookmarkNewsEvent extends BookmarkEvent {
  final int id;

  RemoveBookmarkNewsEvent({required this.id});
}

class GetBookmarkNewsEvent extends BookmarkEvent {}
