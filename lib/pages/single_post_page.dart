import 'package:app/models/post.dart';
import 'package:app/widgets/comment.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SinglePostPage extends StatelessWidget {
  Post post;
  SinglePostPage(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: PostCard(post: post)
      // Column(
      //   children: [
      //     Container(margin: const EdgeInsets.only(top: 120.0), child: PostCard(post: post)),
      //
      //     ListView.builder(
      //       itemCount: post.comments.length,
      //       itemBuilder: (BuildContext context, int index) => CommentWidget(comment: post.comments[index])
      //     )
      //   ]
      // ),
    );
  }
}
