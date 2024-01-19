import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/login_bloc.dart';
import 'package:kel7/bloc/register_bloc.dart';
import 'package:kel7/bloc/user_bloc.dart';
import 'package:kel7/helpers/utils/app_routes.dart';
import 'package:kel7/repositories/user_repository.dart';
import 'package:kel7/screens/auth/login_screen.dart';
import 'package:kel7/screens/auth/register_screen.dart';
import 'package:kel7/screens/features/app_screen.dart';

class RouteGenerator {
  final RouteSettings routeSettings;
  final LoginBloc loginBloc;
  final UserRepository userRepo;

  RouteGenerator(
    this.routeSettings, {
    required this.loginBloc,
    required this.userRepo,
  });

  Route<dynamic>? generate() {
    final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(userRepository: userRepo),
            child: LoginScreen(),
          ),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterBloc>(
            create: (_) => RegisterBloc(userRepository: userRepo),
            child: RegisterScreen(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              //         BlocProvider(create: (_) => BottomNavbarBloc()),
              BlocProvider<UserBloc>(
                create: (_) => UserBloc(userRepository: userRepo),
              ),
              BlocProvider<RegisterBloc>(
                create: (_) => RegisterBloc(userRepository: userRepo),
              ),
              BlocProvider<LoginBloc>(
                create: (_) => LoginBloc(userRepository: userRepo),
              ),
            ],
            child: AppScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
