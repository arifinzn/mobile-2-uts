import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kel7/models/post.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kel7/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<InitPost>(_initPost);
    on<AddPost>(_addPost);
    on<PostList>(_postList);
  }

  _postList(PostList event, Emitter emit) async {
    String search = event.search;
    Future.delayed(Duration(milliseconds: 1000), () {});
    List<Post> postList = <Post>[];
    postList = await postRepository.postList(search: search);
    emit(PostloadedState(postList: postList));
  }

  @override
  Future<void> close() {
    return super.close();
  }

  _initPost(InitPost event, Emitter emit) async {
    emit(PostInitial());
  }

  _addPost(AddPost event, Emitter emit) async {
    emit(PostLoading());
    String desc = event.desc;
    XFile img = event.img;
    emit(PostLoading());
    Map res = await postRepository.addPost(desc: desc, img: img);
    if (res['status'] == true) {
      emit(PostSuccess());
    } else {
      emit(PostFailure(error: 'Post failed'));
    }
  }
}
