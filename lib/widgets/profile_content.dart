import 'package:app/models/user.dart';
import 'package:app/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feed.dart';

class ProfileContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = RepositoryProvider.of<UserRepository>(context).getUser() as User;
    return Column(children: [
      Column(children: [
        Row(children: [
          const Icon(Icons.account_circle_sharp, size: 100),
          Container(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.username, style: const TextStyle(fontSize: 19)),
              Text(user.firstname, style: const TextStyle(fontSize: 17)),
              Text(user.lastname, style: const TextStyle(fontSize: 17)),
              Text(user.link,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic))
            ],
          )
        ]),
        const Text('29 Posts')
      ]),
      Expanded(
        child: Column(
          children: [
            Container(
                margin:
                const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Divider(
                  color: Colors.black,
                  height: 10,
                )),
            Container(width: 600, height: 600, child: Feed())
          ],
        ),
      ),
      // SizedBox(width: 500, height: 1900, child: )
    ]);
  }
}