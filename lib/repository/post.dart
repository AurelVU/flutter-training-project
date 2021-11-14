import 'package:app/models/post.dart';
import 'package:app/models/user.dart';
import 'package:app/models/comment.dart';

class PostRepository {
  List<Post> posts = [
    Post(
      id: 1,
      title: '1 Комментарий',
      text: 'Text',
      time: DateTime.parse("1969-07-20 20:18:04Z"),
      author: User(id: 2, username: 'testUser2', email: 'testUser_2'),
      comments: [
        Comment(id: 1, text: 'Random comment', author: User(id: 2, username: 'SomeUsername', email: 'somemail'))
      ],
      url: 'https://google.com',
      isLiked: true
    ),
    Post(
        id: 2,
        title: '2 комментария',
        text: 'Text2',
        author: User(id: 1, username: 'testUser', email: 'testUser_'),
        comments: [
          Comment(id: 2, text: 'Random comment2', author: User(id: 4, username: 'SomeUsername4', email: 'somemail4')),
          Comment(id: 3, text: 'Random comment3', author: User(id: 6, username: 'SomeUsername6', email: 'somemail6'))
        ],
        url: 'https://google.com',
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        isLiked: false
    ),
    Post(
        id: 3,
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        title: 'Title2',
        text: 'Text2',
        author: User(id: 4, username: 'testUser4', email: 'testUser_4'),
        comments: [],
        url: 'https://google.com',
        isLiked: false),
    Post(
        id: 4,
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        author: User(id: 3, username: 'testUser3', email: 'testUser_3'),
        comments: [],
        title: 'Title2',
        text: 'Text2',
        url: 'https://google.com',
        isLiked: false)
  ];

  loadPosts() {
    return posts;
  }

  loadPostById(int id) {
    return posts.where((item) => item.id == id).first;
  }

  savePost(Post post) {
    posts.add(post);
  }

  deletePost(Post post) {
    posts.removeWhere((item) => item.id == post.id);
  }

  changeLikeStatus(Post post) {
    post.isLiked = !(post.isLiked ?? true);
  }
}