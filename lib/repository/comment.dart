import 'dart:io';
import 'dart:convert';
import 'package:app/models/comment.dart';
import 'package:app/models/post.dart';
import 'package:app/models/user.dart';
import 'package:app/src/const.dart';
import 'package:http/http.dart' as http;

import 'post.dart';
import 'authentication_repository.dart';

class CommentRepository {
  CommentRepository(this.postRepository, this.authRepository);

  PostRepository postRepository;
  AuthenticationRepository authRepository;

  addComment(String comment, int postId) async {
    var url = Uri.https(URL, '/comment/${postId.toString()}');
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${await authRepository.jwtToken}",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({"text": comment}));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      User? user = await authRepository.user;
      try {
        Post post =
            postRepository.posts.firstWhere((element) => element.id == postId);
        post.comments
            .add(Comment(author: user!.username, text: comment, id: 999));
      } catch (_) {}
      try {
        Post userPost =
            user!.posts.firstWhere((element) => element.id == postId);
        userPost.comments
            .add(Comment(author: user.username, text: comment, id: 999));
      } catch (_) {}
      return true;
    } else {
      return false;
    }
  }
}
