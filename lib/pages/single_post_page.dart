import 'package:app/blocs/comment/comment_bloc.dart';
import 'package:app/models/post.dart';
import 'package:app/models/user.dart';
import 'package:app/models/comment.dart';
import 'package:app/widgets/comment_widget.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SinglePostPage extends StatelessWidget {
  Post post;

  SinglePostPage(this.post, {Key? key}) : super(key: key);

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SafeArea(child: PostCard(post: post)),
    );
  }
}
