import 'package:app/models/user.dart';
import 'package:app/models/comment.dart';
import 'package:app/src/const.dart';

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

  static fromJson(json, User? user) {
    List<String> urls = [];
    for (var value
        in json['photos_url'] != null && json['photos_url'].length > 0
            ? json['photos_url']
            : []) {
      if (value['url'] != null) {
        urls.add(value['url']);
      }
    }
    Post p = Post(
        time: DateTime.parse(json['time_created']),
        id: json['id'],
        author: User(
            id: json['author']['id'],
            firstname: json['author']['firstname'],
            lastname: json['author']['lastname'],
            link: 'https://$URL/user/${json["author"]["id"]}',
            username: json['author']['nickname'],
            posts: []),
        isLiked: (user == null)
            ? false
            : json['likes'].firstWhere((like) => like['user_id'] == user.id,
                    orElse: () => null) !=
                null,
        url: 'https://$URL/post/${json['id']}',
        title: json['title'],
        text: json['text'],
        imageLinks: urls,
        comments: List<Comment>.from(
            json['comments'].map((model) => Comment.fromJson(model))));
    return p;
  }
}
