import 'package:app/models/post.dart';

class PostRepository {
  List<Post> posts = [
    Post(
      id: 1,
      time: DateTime.parse("1969-07-20 20:18:04Z"),
      username: 'Test',
      title: 'Title',
      text: 'Text',
      url: 'https://google.com',
      isLiked: true),
    Post(
        id: 2,
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        username: 'Test2',
        title: 'Title2',
        text: 'Text2',
        url: 'https://google.com',
        isLiked: false),
    Post(
        id: 3,
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        username: 'Test2',
        title: 'Title2',
        text: 'Text2',
        url: 'https://google.com',
        isLiked: false),
    Post(
        id: 4,
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        username: 'Test2',
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