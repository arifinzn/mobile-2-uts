part of 'login_bloc.dart';

// @immutable
class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InitLogin extends LoginEvent {
  const InitLogin();
  @override
  List<Object> get props => [];
}

class ProsesLogin extends LoginEvent {
  final String email;
  final String password;
  const ProsesLogin({this.email = "", this.password = ""});
  @override
  List<Object> get props => [email, password];
}

class ProsesLogout extends LoginEvent {
  const ProsesLogout();
  @override
  List<Object> get props => [];
}
