import 'package:app/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feed.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RepositoryProvider
            .of<AuthenticationRepository>(context)
            .user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(children: [
            Column(children: [
              Row(children: [
                const Icon(Icons.account_circle_sharp, size: 100),
                Container(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (snapshot.data == null)
                        ? [
                      Text('Загрузка...',
                          style: const TextStyle(fontSize: 19)),
                      Text('Загрузка...',
                          style: const TextStyle(fontSize: 17)),
                      Text('Загрузка...',
                          style: const TextStyle(fontSize: 17)),
                      Text('Загрузка...',
                          style: const TextStyle(
                              fontSize: 17, fontStyle: FontStyle.italic))
                    ]
                        : [
                      Text(snapshot.data?.username,
                          style: const TextStyle(fontSize: 19)),
                      Text(snapshot.data?.firstname,
                          style: const TextStyle(fontSize: 17)),
                      Text(snapshot.data?.lastname,
                          style: const TextStyle(fontSize: 17)),
                      Text(snapshot.data?.link,
                          style: const TextStyle(
                              fontSize: 17, fontStyle: FontStyle.italic))
                    ],
                  ),
                )
              ]),
              (snapshot.data == null)? const Text('Загрузка...') : Text('${snapshot.data?.posts.length } Posts')
            ]),
            Expanded(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 10,
                      )),
                  Flexible(
                      child: Container(width: 600, height: 600, child: Feed()))
                ],
              ),
            ),
            // SizedBox(width: 500, height: 1900, child: )
          ]);
        });
  }
}
