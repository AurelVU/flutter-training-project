import 'package:app/blocs/comment/comment_bloc.dart';
import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/widgets/comment_field.dart';
import 'package:app/widgets/comment_widget.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SinglePostPage extends StatelessWidget {
  final commentController = TextEditingController();
  int postId;

  SinglePostPage(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RepositoryProvider.of<AuthenticationRepository>(context).user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            Post post = BlocProvider.of<PostBloc>(context)
                .postRepository
                .posts
                .firstWhere((element) => element.id == postId);
            commentController.clear();

            return Scaffold(
                appBar: AppBar(
                  title: Text(post.title),
                ),
                body: SafeArea(
                    child: Column(children: [
                  PostCard(post: post),
                  const Text('Комментарии', style: TextStyle(fontSize: 22)),
                  Expanded(
                      child: ListView.builder(
                          itemCount: post.comments.length,
                          itemBuilder: (buildContext, index) {
                            return CommentWidget(comment: post.comments[index]);
                          })),
                  (snapshot.data != null)
                      ? Column(children: [
                          CommentTextWidget(commentController),
                          ElevatedButton(
                              onPressed: () {
                                if (commentController.text.isNotEmpty) {
                                  BlocProvider.of<CommentBloc>(context).add(
                                      AddCommentEvent(
                                          commentController.text, post.id));
                                }
                              },
                              child: const Text('Отправить'))
                        ])
                      : const Padding(padding: EdgeInsets.zero)
                ])));
          });
        });
  }
}
