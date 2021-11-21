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
      author: User(id: 2, username: 'testUser2', email: 'testUser_2', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'),
      comments: [
        Comment(id: 1, text: 'Random comment', author: User(id: 2, username: 'SomeUsername', email: 'somemail', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'))
      ],
      imageLinks: ['https://mobimg.b-cdn.net/v3/fetch/15/15c5a0b2a3ae3e2ae5dd3c1573bc5a8a.jpeg'],
      url: 'https://google.com',
      isLiked: true
    ),
    Post(
        id: 2,
        title: '2 комментария',
        text: 'Text2',
        author: User(id: 1, username: 'testUser', email: 'testUser_', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'),
        comments: [
          Comment(id: 2, text: 'Random comment2', author: User(id: 4, username: 'SomeUsername4', email: 'somemail4', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com')),
          Comment(id: 3, text: 'Random comment3', author: User(id: 6, username: 'SomeUsername6', email: 'somemail6', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'))
        ],
        imageLinks: [
          'https://99px.ru/sstorage/56/2016/03/11403161925248274.jpg',
          'https://funik.ru/wp-content/uploads/2018/10/17478da42271207e1d86.jpg',
          'https://w-dog.ru/wallpapers/5/19/468461865377659/koshka-leto-fon.jpg'
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
        author: User(id: 4, username: 'testUser4', email: 'testUser_4', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'),
        imageLinks: [
          'https://i.pinimg.com/736x/fb/ff/f6/fbfff6a63b4c0931887c8a399234fe07--nature-instagram.jpg',
          'https://c.wallhere.com/photos/fa/29/2560x1600_px_baby_cat_cats_cute_Kitten_kittens-1906687.jpg!d'
        ],
        comments: [],
        url: 'https://google.com',
        isLiked: false),
    Post(
        id: 4,
        time: DateTime.parse("2021-07-20 20:18:04Z"),
        author: User(id: 3, username: 'testUser3', email: 'testUser_3', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'),
        comments: [],
        imageLinks: [],
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