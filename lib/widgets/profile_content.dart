import 'package:app/pages/single_post_page.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/widgets/loading_indicator.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RepositoryProvider.of<AuthenticationRepository>(context).user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(children: [
            Column(children: [
              Row(children: [
                snapshot.data == null || snapshot.data?.avatarUrl == null
                    ? const Icon(Icons.account_circle_sharp, size: 100)
                    : Container(
                      margin: const EdgeInsets.all(15),
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(snapshot.data.avatarUrl),
                          backgroundColor: Colors.transparent,
                        ),
                    ),
                Container(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (snapshot.data == null)
                        ? [
                            const Text('Загрузка...',
                                style: TextStyle(fontSize: 19)),
                            const Text('Загрузка...',
                                style: TextStyle(fontSize: 17)),
                            const Text('Загрузка...',
                                style: TextStyle(fontSize: 17)),
                            const Text('Загрузка...',
                                style: TextStyle(
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
              (snapshot.data == null)
                  ? const Text('Загрузка...')
                  : Text('${snapshot.data?.posts.length} Posts')
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
                      child: snapshot.data != null
                          ? ListView.builder(
                              itemCount: snapshot.data?.posts.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    child: PostCard(
                                        post: snapshot.data?.posts[index]),
                                    onTap: () async {
                                      await Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return SinglePostPage(
                                            snapshot.data?.posts[index]);
                                      }));
                                    });
                              })
                          : const LoadingIndicator())
                ],
              ),
            ),
            // SizedBox(width: 500, height: 1900, child: )
          ]);
        });
  }
}
