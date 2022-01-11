part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostsLoadSuccess extends PostState{
  final List<Post> posts;
  final bool feedIsOver;

  PostsLoadSuccess(this.posts, this.feedIsOver);
}

class PostsLoadInProgress extends PostState{

}

class PostsLoadFailure extends PostState{

}
