import 'package:app/models/post.dart';

class User {
  final int id;
  String username;
  String firstname;
  String lastname;
  String link;
  List<Post> posts;

  User(
      {required this.id,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.link,
      required this.posts});

  static fromJson({json, userId, User? currentUser = null}) {
    Iterable l = json['posts'];
    User u = User(
        link: json['website'],
        username: json['nickname'],
        id: userId,
        lastname: json['lastname'],
        firstname: json['firstname'],
        posts: []);
    List<Post> posts = List<Post>.from(
        l.map((model) => Post.fromJson(model, currentUser ?? u)));
    u.posts = posts;
    return u;
  }
}
