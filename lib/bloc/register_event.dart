part of 'register_bloc.dart';

// @immutable
class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class InitRegister extends RegisterEvent {
  const InitRegister();
  @override
  List<Object> get props => [];
}

class ProsesRegister extends RegisterEvent {
  final String npm;
  final String name;
  final String email;
  final String phone;
  final String password;
  const ProsesRegister(
      {this.npm = "",
      this.name = "",
      this.email = "",
      this.phone = "",
      this.password = ""});
  @override
  List<Object> get props => [npm, name, email, phone, password];
}
