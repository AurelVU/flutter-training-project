part of 'post_bloc.dart';

@immutable
abstract class PostsEvent {}

class PostsLoadEvent extends PostsEvent {

}

class PostsAddedEvent extends PostsEvent {
  final Post post;

  PostsAddedEvent({required this.post});

  @override
  String toString() => 'PostAdded { post: $post }';
}

class PostsDeletedEvent extends PostsEvent {
  final Post post;

  PostsDeletedEvent({required this.post});
}

class PostChangeLikeStatusEvent extends PostsEvent {
  final Post post;

  PostChangeLikeStatusEvent({required this.post});

  @override
  String toString() => 'Post liked or unliked { post: $post }';
}

class OpenCurrentPostEvent extends PostsEvent {
  Post post;

  OpenCurrentPostEvent(this.post);
}