part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoadInProgress extends CommentState{

}

class CommentLoadSuccess extends CommentState{

}