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

class ProsesUser extends UserEvent {
  final String npm;
  final String name;
  final String email;
  final String phone;
  final String password;
  const ProsesUser(
      {this.npm = "",
      this.name = "",
      this.email = "",
      this.phone = "",
      this.password = ""});
  @override
  List<Object> get props => [npm, name, email, phone, password];
}
