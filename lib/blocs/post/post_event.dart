part of 'post_bloc.dart';

@immutable
abstract class PostsEvent {}

// class PostsLoadEvent extends PostsEvent {
//
// }

class SoftPostsLoadEvent extends PostsEvent {

}

class PostsAddedEvent extends PostsEvent {
  String title;
  String text;
  List<String> imagePaths;

  PostsAddedEvent({required this.title, required this.text, required this.imagePaths});
}

class PostsDeletedEvent extends PostsEvent {
  final Post post;

  PostsDeletedEvent({required this.post});
}


class LoadPage extends PostsEvent {
  final int indexPage;

  LoadPage(this.indexPage);
}


class PostChangeLikeStatusEvent extends PostsEvent {
  final Post post;

  PostChangeLikeStatusEvent({required this.post});

  @override
  String toString() => 'Post liked or unliked { post: $post }';
}
