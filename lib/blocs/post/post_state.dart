part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostsLoadSuccess extends PostState{
  final List<Post> posts;

  PostsLoadSuccess(this.posts);
}

class PostsLoadInProgress extends PostState{

}

class PostsLoadFailure extends PostState{

}