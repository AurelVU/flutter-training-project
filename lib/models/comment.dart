import 'package:app/models/user.dart';

class Comment {
  final int id;
  final String author;
  final String text;

  Comment({required this.id, required this.author, required this.text});

  static fromJson(json) {
    return Comment(id: json['post_id'], author: 'author', text: json['text']);
  }
}