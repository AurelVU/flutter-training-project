import 'package:app/models/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  Comment comment;

  CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Container(
                margin:
                const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Divider(
                  color: Colors.black,
                  height: 10,
                )),
            Text(comment.author.username),
            Text(comment.text)
          ],
        ),
      ),
    ]);
  }
}