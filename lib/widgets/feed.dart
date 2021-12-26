import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/models/post.dart';
import 'package:app/pages/single_post_page.dart';
import 'package:app/widgets/loading_indicator.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state)
    {
      if (state is PostsLoadSuccess) {
        print('refresh');
        List<Post> posts = state.posts;

        return Stack(children: [
          Expanded(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: PostCard(post: posts[index]),
                      onTap: () async {
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return SinglePostPage(posts[index]);
                            }));
                      });
                }),
          )
        ]);
      } else {
        return const LoadingIndicator();
      }
    });
  }
}