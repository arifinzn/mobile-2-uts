part of 'user_bloc.dart';

@immutable
class UserState {}

class LoginInitial extends UserState {}

class LoginLoading extends UserState {}

class LoginSuccess extends UserState {
  final String sessionToken;
  LoginSuccess({required this.sessionToken});
}

class LoginFailure extends UserState {
  final String error;
  LoginFailure({required this.error});
}
