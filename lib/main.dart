import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/helpers/localizations/language.dart';
import 'package:kel7/helpers/theme/app_notifier.dart';
import 'package:kel7/helpers/utils/route_generator.dart';
import 'package:kel7/repositories/post_repository.dart';
import 'package:kel7/screens/auth/login_screen.dart';
import 'package:kel7/repositories/user_repository.dart';
import 'package:kel7/bloc/login_bloc.dart';
import 'package:kel7/bloc/register_bloc.dart';
import 'package:kel7/screens/features/splash_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/utils/navigation_service.dart';
import 'package:kel7/helpers/utils/locator.dart';
import 'package:kel7/helpers/utils/app_routes.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  AppTheme.init();

  setupLocator();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final UserRepository userRepository = locator<UserRepository>();
  final PostRepository postRepository = locator<PostRepository>();
  final LoginBloc loginBloc = LoginBloc(userRepository: userRepository);

  // runApp(ChangeNotifierProvider<AppNotifier>(
  //   create: (context) => AppNotifier(),
  //   child: MyApp(
  //     loginBloc: loginBloc,
  //     userRepository: userRepository,
  //   ),
  // ));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                LoginBloc(userRepository: userRepository)..add(InitLogin()))
      ],
      child: MyApp(
        loginBloc: loginBloc,
        userRepository: userRepository,
        postRepository: postRepository,
        // initScreen: initScreen,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LoginBloc loginBloc;
  final UserRepository userRepository;
  final PostRepository postRepository;

  const MyApp({
    super.key,
    required this.loginBloc,
    required this.userRepository,
    required this.postRepository,
  });

  @override
  Widget build(BuildContext context) {
    final navService = locator<NavigationService>();
    final initRoute = AppRoutes.login;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      // home: LoginScreen(),
      // home: MultiRepositoryProvider(
      //   providers: [
      //     RepositoryProvider(
      //       create: (context) => UserRepository(),
      //     ), // RepositoryProvider,
      //   ],
      //   child: MultiBlocProvider(
      //     providers: [
      //       BlocProvider<RegisterBloc>(
      //         create: (BuildContext context) => RegisterBloc(
      //             userRepository: context.read<UserRepository>()),
      //       ),
      //       BlocProvider<LoginBloc>(
      //         create: (BuildContext context) =>
      //             LoginBloc(userRepository: context.read<UserRepository>()),
      //       ),
      //     ],
      //     child: MainScreen(),
      //   ), // MultiBlocProviduser1@mail.com  er ), // MultiRepositoryProvider
      // ),
      home: BlocListener<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state is LoginSuccess) {
            navService.pushTo(AppRoutes.home);
          } else {
            navService.pushTo(AppRoutes.login);
          }
        },
        child: const SplashScreen(),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: AppTheme.textDirection,
          child: child ?? Container(),
        );
      },
      // localizationsDelegates: [
      //   AppLocalizationsDelegate(context),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: Language.getLocales(), initialRoute: initRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: (routeSettings) => RouteGenerator(
        routeSettings,
        loginBloc: loginBloc,
        userRepo: userRepository,
        postRepo: postRepository,
      ).generate(),
    );
  }
}
