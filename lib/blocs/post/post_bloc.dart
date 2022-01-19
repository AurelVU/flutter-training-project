import 'dart:async';

import 'package:app/models/post.dart';
import 'package:app/repository/post.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostsEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostsEvent event) async* {
      // if (event is PostsLoadEvent)
      // {
      //   yield PostsLoadInProgress();
      //   yield PostsLoadSuccess(await postRepository.loadPosts());
      // }
      if (event is SoftPostsLoadEvent) {
        yield PostsLoadSuccess(postRepository.posts, false);
      }
      if (event is PostsAddedEvent)
      {
        yield PostsLoadInProgress();
        await postRepository.savePost(event.title, event.text, event.imagePaths);
        yield PostsLoadSuccess(await postRepository.loadPosts(), false);
      }
      if (event is PostsDeletedEvent)
      {
        yield PostsLoadInProgress();
        await postRepository.deletePost(event.post);
        yield PostsLoadSuccess(await postRepository.loadPosts(), false);
      }
      if (event is PostChangeLikeStatusEvent)
      {
        yield PostsSoftUpdating(postRepository.posts, false);
        await postRepository.changeLikeStatus(event.post);
        yield PostsLoadSuccess(postRepository.posts, false);
      }
      if (event is LoadPage) {
        print("Load ${event.indexPage}");
        List<Post> posts = await postRepository.loadNextPage(event.indexPage);
        print("Loaded ${posts.length} elements");
        yield PostsLoadSuccess(postRepository.posts, posts.isEmpty);
      }
  }
}
