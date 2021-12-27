import 'package:app/models/post.dart';

class User
{
  final int id;
  String username;
  String email;
  String firstname;
  String lastname;
  String link;
  List<Post> posts;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.link,
    required this.posts
  });

  static fromJson(json) {
    Iterable l = json['posts'];
    User u = new User(
      email: '',
      link: json['website'],
      username: json['nickname'],
      id: 1,
      lastname: json['lastname'],
      firstname: json['firstname'],
      posts: List<Post>.from(l.map((model) => Post.fromJson(model, null)))
    );
    return u;
  }
}