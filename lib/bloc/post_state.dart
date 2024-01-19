part of 'post_bloc.dart';

@immutable
class PostState {}

class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostloadedState extends PostState {
  final List<Post> postList;
  PostloadedState({required this.postList});

  @override
  List<Object> get props => [postList];
}

class PostLoadingFailedState extends PostState {}

class InternetConnectionFailedState extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  PostSuccess();
}

class PostFailure extends PostState {
  final String error;
  PostFailure({required this.error});
}
