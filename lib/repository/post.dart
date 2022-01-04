import 'dart:convert';
import 'dart:io';

import 'package:app/models/post.dart';
import 'package:app/models/user.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/src/const.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  List<Post> posts = [];
  AuthenticationRepository authRepository;

  PostRepository(this.authRepository);

  Future<List<Post>> loadPosts() async {
    var url = Uri.https(URL, '/post/');
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {}
    Iterable l = json.decode(response.body);
    User? user = await authRepository.user;
    List<Post> posts =
        List<Post>.from(l.map((model) => Post.fromJson(model, user)));
    this.posts = posts;
    return posts;
  }

  Future<Post> loadPostById(int id) async {
    var url = Uri.https(URL, '/post/$id');
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {}
    User? user = await authRepository.user;
    Post post = Post.fromJson(json.decode(response.body), user);
    return post;
  }

  Future<bool> savePost(String title, String text) async {
    var url = Uri.https(URL, '/post/');
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${await authRepository.jwtToken}",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({"text": text, "title": title, "photos_url": []}));
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<bool> deletePost(Post post) async {
    // ToDo: Добавить удаление на сервере
    posts.removeWhere((item) => item.id == post.id);
    return true;
  }

  Future<bool> changeLikeStatus(Post post) async {
    var url = Uri.https(URL, '/post/${post.id}/like');
    var response = await http.post(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${await authRepository.jwtToken}",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      post.isLiked = !(post.isLiked ?? true);
      return true;
    }
    return false;
  }
}
