import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class ProfileContent extends StatelessWidget {
  String username = 'user_name';
  String firstname = 'firstname';
  String lastname = 'lastname';
  String link = 'www.website.com';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(children: [
        Row(children: [
          const Icon(Icons.account_circle_sharp, size: 100),
          Container(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: const TextStyle(fontSize: 19)),
              Text(firstname, style: const TextStyle(fontSize: 17)),
              Text(lastname, style: const TextStyle(fontSize: 17)),
              Text(link,
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