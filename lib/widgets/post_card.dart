import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:app/pages/single_post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class PostCard extends StatelessWidget {
  final Post post;
  late PostBloc bloc;

  PostCard({Key? key, required this.post}) : super(key: key);

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    bloc.add(PostChangeLikeStatusEvent(post: post));

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    return Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
              title: Row(children: [
                Text(post.title),
                Expanded(child: Container(width: 20)),
                Text(post.time.toString()),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ]),
              subtitle: Column(
                children: [
                  Text(post.text),
                  Row(
                    children: const [
                      Expanded(
                          child: Image(
                              image: AssetImage('assets/images/facebook.png'),
                              width: 100,
                              height: 100)),
                      Expanded(
                          child: Image(
                              image: AssetImage('assets/images/instagram.png'),
                              width: 100,
                              height: 100)),
                      Expanded(
                          child: Image(
                              image: AssetImage('assets/images/twitter.png'),
                              width: 100,
                              height: 100)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.account_circle_sharp),
                          onPressed: () {},
                        ),
                        margin: const EdgeInsets.only(right: 10.0),
                      ),
                      Expanded(child: Text(post.username)),
                      IconButton(
                        icon: const Icon(Icons.add_comment_rounded),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                      // IconButton(icon: const Icon(Icons.favorite, color: Colors.pink), onPressed: () {  },)
                      LikeButton(
                          isLiked: post.isLiked,
                          bubblesSize: 0,
                          onTap: onLikeButtonTapped),
                    ],
                  )
                ],
              )),
        ]));
  }
}
