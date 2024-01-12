import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/helpers/localizations/app_localization_delegate.dart';
import 'package:kel7/helpers/localizations/language.dart';
import 'package:kel7/helpers/theme/app_notifier.dart';
import 'package:kel7/screens/auth/login_screen.dart';
import 'package:kel7/repositories/user_repository.dart';
import 'package:kel7/bloc/user_bloc.dart';
import 'package:kel7/screens/features/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:kel7/helpers/theme/app_theme.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  AppTheme.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        // home: LoginScreen(),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => UserRepository(),
            ), // RepositoryProvider,
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    UserBloc(userRepository: context.read<UserRepository>())
                      ..add(const InitUser()),
              ), // BlocProvider
            ],
            child: MainScreen(),
          ), // MultiBlocProvider ), // MultiRepositoryProvider
        ),
        builder: (context, child) {
          return Directionality(
            textDirection: AppTheme.textDirection,
            child: child ?? Container(),
          );
        },
        localizationsDelegates: [
          AppLocalizationsDelegate(context),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Language.getLocales(),
        // home: IntroScreen(),
        // home: CookifyShowcaseScreen(),
      );
    });
  }
}
