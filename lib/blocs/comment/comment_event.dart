part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class AddCommentEvent extends CommentEvent
{
  String comment;
  int postId;

  AddCommentEvent(this.comment, this.postId);
}