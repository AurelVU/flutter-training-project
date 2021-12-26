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
      yield PostsLoadInProgress();
      if (event is PostsLoadEvent)
      {
        List<Post> posts = await postRepository.loadPosts();
        yield PostsLoadSuccess(posts);
      }
      if (event is PostsAddedEvent)
      {
        postRepository.savePost(event.title, event.text);
        yield PostsLoadSuccess(await postRepository.loadPosts());
      }
      if (event is PostsDeletedEvent)
      {
        postRepository.deletePost(event.post);
        yield PostsLoadSuccess(await postRepository.loadPosts());
      }
      if (event is PostChangeLikeStatusEvent)
      {
        postRepository.changeLikeStatus(event.post);
        yield PostsLoadSuccess(await postRepository.loadPosts());
      }
  }
}
