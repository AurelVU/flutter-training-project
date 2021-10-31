import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class PostCard extends StatelessWidget {
  final String textMessage =
      'Как бы со всего размаха крепкою палкой кто-то из ближайших солдат, как '
      'ему показалось, ударил его в голову. Немного это больно было, а главное, '
      'неприятно, потому что боль эта развлекала его и мешала ему видеть то, '
      'на что он смотрел.';
  final String title = 'Небо Аустерлица';
  final String strTime = '14:00';
  final String username = 'username';

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
        title: Row(children: [
          Text(title),
          Expanded(child: Container(width: 20)),
          Text(strTime),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {  },),
        ]),
        subtitle:
        Column(children: [
          Text(textMessage),
          Row(
            children: const [
              Expanded(child: Image(image: AssetImage('assets/images/facebook.png'), width: 100, height: 100)),
              Expanded(child: Image(image: AssetImage('assets/images/instagram.png'), width: 100, height: 100)),
              Expanded(child: Image(image: AssetImage('assets/images/twitter.png'), width: 100, height: 100)),
            ],
          ),
          Row(
            children: [
              Container(
                child: IconButton(icon: const Icon(Icons.account_circle_sharp), onPressed: () {  },),
                margin: const EdgeInsets.only(right: 10.0),
              ),
              Expanded(child: Text(username)),
              IconButton(icon: const Icon(Icons.add_comment_rounded), onPressed: () {  },),
              IconButton(icon: const Icon(Icons.share), onPressed: () {  },),
              // IconButton(icon: const Icon(Icons.favorite, color: Colors.pink), onPressed: () {  },)
              LikeButton(),
            ],
          )
        ],)
      ),
    ]));
  }
}
