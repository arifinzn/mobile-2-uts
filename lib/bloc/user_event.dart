part of 'user_bloc.dart';

// @immutable
class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class InitUser extends UserEvent {
  const InitUser();
  @override
  List<Object> get props => [];
}

class ProsesLogin extends UserEvent {
  final String email;
  final String password;
  const ProsesLogin({this.email = "", this.password = ""});
  @override
  List<Object> get props => [email, password];
}

class ProsesLogout extends UserEvent {
  const ProsesLogout();
  @override
  List<Object> get props => [];
}
