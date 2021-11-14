import 'package:app/models/user.dart';
import 'package:app/models/comment.dart';

class Post {
  final String title;
  final String text;
  final DateTime time;
  final User author;
  final List<Comment> comments;
  final int id;
  final String url;
  bool? isLiked;

  Post(
      {required this.id,
      required this.comments,
      required this.time,
      required this.author,
      required this.title,
      required this.text,
      required this.url,
      required this.isLiked});
}
