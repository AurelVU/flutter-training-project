import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:like_button/like_button.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class PostCard extends StatelessWidget {
  Post post;
  late PostBloc bloc;
  late AuthenticationRepository authRepository;

  PostCard({Key? key, required this.post}) : super(key: key);

  String formatDateTime(DateTime postedTime) {
    DateTime timeNow = DateTime.now();
    var difference = timeNow.difference(postedTime);
    if (difference.inDays > 30) {
      return formatDate(postedTime, [yy, '-', M, '-', d]);
    }
    if (difference.inHours > 24) {
      return difference.inDays.toInt().toString() + 'd';
    }
    if (difference.inMinutes > 60) {
      return difference.inHours.toInt().toString() + 'h';
    }
    if (difference.inSeconds > 60) {
      return difference.inMinutes.toInt().toString() + 'm';
    }
    return 'Just now';
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (await authRepository.user != null) {
      bloc.add(PostChangeLikeStatusEvent(post: post));
      return !isLiked;
    } else {
      return isLiked;
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: post.title,
        text: post.text,
        linkUrl: post.url,
        chooserTitle: post.author.username);
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    authRepository = RepositoryProvider.of<AuthenticationRepository>(context);
    List<Image> images = [];
    List<Image> imagesForButtons = [];
    List<Widget> widgetImageList = [];
    for (var element in post.imageLinks) {
      try {
      images.add(Image.network(element));
      imagesForButtons.add(Image.network(element, fit: BoxFit.cover)); }
      catch (_) {

      }
    }
    imagesForButtons.forEach((element) => widgetImageList.add(IconButton(
          iconSize: 110,
          icon: element,
          onPressed: () {
            SwipeImageGallery(
                    context: context,
                    images: images,
                    transitionDuration: 120,
                    initialIndex: images.indexOf(element))
                .show();
          },
        )));

    return Card(
      child: ListTile(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(post.title),
            Row(children: [
              Text(formatDateTime(post.time)),
              PopupMenuButton(itemBuilder: (_) {
                return [
                  PopupMenuItem(
                      child: const Text('???????????????????????? ???? ????????????'),
                      onTap: () {
                        Future<void>.delayed(
                            const Duration(),
                            () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('???????????? ????????????'),
                                    content: const Text(
                                        '???????????? ???? ???????????? ?????????????? ????????????'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('????')),
                                    ],
                                  );
                                }));
                      }),
                  PopupMenuItem(
                      child: const Text('???????????????????????? ???? ????????????????????????'),
                      onTap: () {
                        Future<void>.delayed(
                            const Duration(),
                            () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('???????????? ????????????'),
                                    content: const Text(
                                        '???????????? ???? ???????????????????????? ?????????????? ????????????'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('????')),
                                    ],
                                  );
                                }));
                      })
                ];
              })
            ])
          ]),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(post.text),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgetImageList,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    IconButton(
                      icon: post.author.avatarUrl == null ?
                      Icon(Icons.account_circle_sharp) : CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(post.author.avatarUrl!),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                    ),
                    Text(post.author.username),
                    // IconButton( ToDo: ?????? ?????????????????????????? ??????????????
                    //   icon: const Icon(Icons.add_comment_rounded),
                    //   onPressed: () {},
                    // )
                  ]),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () => share(),
                      ),
                      LikeButton(
                          isLiked: post.isLiked,
                          bubblesSize: 0,
                          onTap: onLikeButtonTapped),
                      Text(post.likeCount.toString())
                      // Text(data: post.)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
