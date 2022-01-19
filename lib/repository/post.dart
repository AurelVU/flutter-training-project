import 'dart:convert';
import 'dart:io';

import 'package:app/models/post.dart';
import 'package:app/models/user.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/repository/image.dart';
import 'package:app/src/const.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  List<Post> posts = [];
  AuthenticationRepository authRepository;
  ImageRepository imageRepository;

  PostRepository(this.authRepository, this.imageRepository);

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

  Future<List<Post>> loadNextPage(int index) async {
    var args = {'page': index.toString()};
    var url = Uri.https(URL, '/post/', args);
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {}
    Iterable l = json.decode(response.body);
    User? user = await authRepository.user;
    List<Post> posts =
    List<Post>.from(l.map((model) => Post.fromJson(model, user)));
    this.posts.addAll(posts);
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

  Future<bool> savePost(String title, String text, List<String> paths) async {
    List<String> photoUrls = [];
    for (var path in paths) {
      String? photoUrl = await imageRepository.sendImage(path);
      if (photoUrl != null) {
        photoUrls.add(photoUrl);
      }
    }
    var url = Uri.https(URL, '/post/');
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer ${await authRepository.jwtToken}",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({
          "text": text,
          "title": title,
          "photos_url": photoUrls.map((e) => {'url': e}).toList()
        }));
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
      HttpHeaders.authorizationHeader:
      "Bearer ${await authRepository.jwtToken}",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      post.isLiked = !(post.isLiked ?? true);
      if (post.isLiked == true) {
        post.likeCount++;
      } else {
        post.likeCount--;
      }
      try {
        var tmp = posts.firstWhere((element) => element.id == post.id);
        if (tmp.isLiked != post.isLiked) {
          tmp.isLiked = !(tmp.isLiked ?? true);
          if (tmp.isLiked == true) {
            tmp.likeCount++;
          } else {
            tmp.likeCount--;
          }
        }
      } catch (_) {}
      return true;
    }
    return false;
  }
}
