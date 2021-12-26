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
  final List<String> imageLinks;
  bool? isLiked;

  Post(
      {required this.id,
      required this.comments,
      required this.time,
      required this.author,
      required this.title,
      required this.text,
      required this.url,
      required this.imageLinks,
      required this.isLiked});

  static fromJson(json) {
    Post p = new Post(
        time: DateTime.parse(json['time_created']),
        id: json['id'],
        author: User(
            id: 1,
            email: 'test',
            firstname: 'test',
            lastname: 'test',
            link: 'test',
            username: 'test'),
        isLiked: null,
        url: '',
        title: json['title'],
        text: json['text'],
        imageLinks: [],
        comments: []);
    return p;
  }
}
