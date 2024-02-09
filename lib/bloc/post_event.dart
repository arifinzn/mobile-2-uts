part of 'post_bloc.dart';

// @immutable
class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class InitPost extends PostEvent {
  const InitPost();
  @override
  List<Object> get props => [];
}

class PostList extends PostEvent {
  final String search;
  const PostList({this.search = ""});
  @override
  List<Object> get props => [search];
}

class AddPost extends PostEvent {
  final String desc;
  final XFile img;
  const AddPost({this.desc = "", required this.img});
  @override
  List<Object> get props => [desc, img];
}
