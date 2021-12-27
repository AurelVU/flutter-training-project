import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPost extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
              title: Row(children: [
                TextFormField(
                  // указываем для поля границу,
                  // иконку и подсказку (hint)
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Заголовок")),
                Expanded(child: Container(width: 20)),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ]),
              subtitle: Column(
                children: [
                  TextFormField(
                    // указываем для поля границу,
                    // иконку и подсказку (hint)
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Текст")),
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
                      IconButton(
                        icon: const Icon(Icons.add_comment_rounded),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              )),
        ]));
  }

}

class NewPost2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost2> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
          title: Row(children: [
            TextFormField(
                // указываем для поля границу,
                // иконку и подсказку (hint)
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Заголовок")),
            Expanded(child: Container(width: 20)),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ]),
          subtitle: Column(
            children: [
              TextFormField(
                  // указываем для поля границу,
                  // иконку и подсказку (hint)
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Текст")),
              Flexible(
                child: Row(
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
              ),
              Flexible(
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        icon: const Icon(Icons.account_circle_sharp),
                        onPressed: () {},
                      ),
                      margin: const EdgeInsets.only(right: 10.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_comment_rounded),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          )),
    ]));
  }
}
