import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/login_bloc.dart';
import 'package:kel7/helpers/widgets/error_message.dart';
import 'package:kel7/screens/auth/login_screen.dart';
import 'package:kel7/screens/auth/register_screen.dart';
import 'package:kel7/screens/features/app_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
    //  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    //   if (state is LoginInitial) {
    //     return LoginScreen();
    //   } else if (state is LoginLoading) {
    //     return const CircularProgressIndicator(strokeWidth: 1.4);
    //   } else if (state is LoginSuccess) {
    //     return AppScreen();
    //   } else if (state is RegisterInitial) {
    //     return RegisterScreen();
    //   } else if (state is RegisterLoading) {
    //     return const CircularProgressIndicator(strokeWidth: 1.4);
    //   } else if (state is RegisterSuccess) {
    //     return AppScreen();
    //   } else if (state is LoginFailure) {
    //     return ErrorMessage(message: state.error);
    //   } else if (state is RegisterFailure) {
    //     return ErrorMessage(message: state.error);
    //   } else {
    //     return Container();
    //   }
    // }); // BlocBuilder
  }
}
