import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
          PostCard(),
        ],
      ),
      Positioned(
          right: 30,
          bottom: 30,
          child: ElevatedButton(
            onPressed: () {},
            child: const Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            )),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(75, 75), shape: const CircleBorder()),
          ))
    ]);
  }
}
