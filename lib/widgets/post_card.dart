import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:like_button/like_button.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class PostCard extends StatelessWidget {
  Post post;
  late PostBloc bloc;

  PostCard({Key? key, required this.post}) : super(key: key);

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    bloc.add(PostChangeLikeStatusEvent(post: post));

    return !isLiked;
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: post.title,
        text: post.text,
        linkUrl: post.url,
        chooserTitle: post.author.username
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    List<Image> images = [];
    List<Expanded> widgetImageList = [];
    post.imageLinks.forEach((element) {
      images.add(Image.network(element));
    });
    images.forEach((element) => widgetImageList.add(Expanded(
        child: IconButton(
          icon: element,
          iconSize: 110,
          onPressed: () {
            SwipeImageGallery(
              context: context,
              images: images,
            ).show();
          },
        ))));


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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(post.text),
              Row(
                children: widgetImageList,
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
                    onPressed: () => share(),
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
