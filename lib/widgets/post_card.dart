import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

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
    List<Image> images = [
      Image(image: AssetImage('assets/images/facebook.png')),
      Image(image: AssetImage('assets/images/instagram.png')),
      Image(image: AssetImage('assets/images/twitter.png')),
    ];
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
                children: [
                  Expanded(
                      child: IconButton(
                      icon: images[0],
                      iconSize: 110,
                      onPressed: () {
                        SwipeImageGallery(
                          context: context,
                          images: images,
                        ).show();
                      },
                  )),
                  Expanded(
                      child: IconButton(
                      icon: images[1],
                      iconSize: 110,
                      onPressed: () {
                        SwipeImageGallery(
                          context: context,
                          images: images,
                        ).show();
                      },
                  )),
                  Expanded(
                      child: IconButton(
                      icon: images[2],
                      iconSize: 110,
                      onPressed: () {
                        SwipeImageGallery(
                          context: context,
                          images: images,
                        ).show();
                      },
                  )),
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
                  Expanded(child: Text(post.author.username)),
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
