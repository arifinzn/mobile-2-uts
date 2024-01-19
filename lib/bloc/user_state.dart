part of 'user_bloc.dart';

@immutable
class UserState {}

class UserInitial extends UserState {}

class UserData extends UserState {
  final User data;

  UserData(this.data);

  @override
  String toString() => 'UserLoaded';
}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final String sessionToken;
  UserSuccess({required this.sessionToken});
}

class UserFailure extends UserState {
  final String error;
  UserFailure({required this.error});
}
