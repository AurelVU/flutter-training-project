import 'package:app/models/user.dart';

class Comment {
  final int id;
  final User author;
  final String text;

  Comment({required this.id, required this.author, required this.text});
}