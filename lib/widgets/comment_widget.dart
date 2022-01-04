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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Divider(
                  color: Colors.black,
                  height: 10,
                )),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Column(children: [
                Text(comment.author, style: const TextStyle(fontSize: 20)),
                Text(comment.text, style: const TextStyle(fontSize: 16))
              ]),
            )
          ],
        ),
      ),
    ]);
  }
}
