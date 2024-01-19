part of 'register_bloc.dart';

@immutable
class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String sessionToken;
  RegisterSuccess({required this.sessionToken});
}

class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure({required this.error});
}
