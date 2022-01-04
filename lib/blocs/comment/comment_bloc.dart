import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/repository/comment.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {

  CommentBloc(this.commentRepository, this.postBloc) : super(CommentInitial()) {}

  CommentRepository commentRepository;
  PostBloc postBloc;

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is AddCommentEvent)
    {
      yield CommentLoadInProgress();
      await commentRepository.addComment(event.comment, event.postId);
      postBloc.add(SoftPostsLoadEvent());
      yield CommentLoadSuccess();
    }
  }
}
