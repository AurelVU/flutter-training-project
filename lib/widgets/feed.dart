import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/pages/single_post_page.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      return ListView.builder(itemBuilder: (BuildContext context, int index) {
        if (state is PostsLoadSuccess && state.posts.length > index) {
          return GestureDetector(
              child: PostCard(post: state.posts[index]),
              onTap: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) {
                  return SinglePostPage(state.posts[index].id);
                }));
              });
        } else {
          if (state is PostsLoadSuccess &&
              !state.feedIsOver &&
              index % 7 == 0 &&
              state.posts.length == index) {
            print("index $index");
            BlocProvider.of<PostBloc>(context).add(LoadPage(index ~/ 7));
          }
          return Card(
            child: ListTile(
              title: Container(
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                    border: Border.all(width: 10, style: BorderStyle.none),
                  )),
              subtitle: Container(
                  margin: EdgeInsets.all(5),
                  width: 70,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                    border: Border.all(width: 10, style: BorderStyle.none),
                  )),
            ),
          );
        }
      });
    });
  }
}
