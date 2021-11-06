import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:app/widgets/loading_indicator.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostsLoadSuccess) {
        List<Post> posts = state.posts;

        return Scaffold(
            appBar: AppBar(title: const Text('Тест')),
            body: Stack(children: [
              ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PostCard(post: posts[index]);
                  }),
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
                        fixedSize: const Size(75, 75),
                        shape: const CircleBorder()),
                  ))
            ]));
      } else {
        return Scaffold(
            appBar: AppBar(title: const Text('Тест')),
            body: const LoadingIndicator()
        );
      }
    });
  }
}
