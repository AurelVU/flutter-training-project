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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  PostCard(post: post),

                  Flexible(
                    child: ListView.builder(
                      itemCount: post.comments.length,
                      itemBuilder: (BuildContext context, int index) => CommentWidget(comment: post.comments[index])
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          // указываем для поля границу,
                          // иконку и подсказку (hint)
                          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Комменарий")
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text('Отправить')
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
