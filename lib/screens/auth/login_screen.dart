import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/login_bloc.dart';
import 'package:kel7/helpers/theme/custom_theme.dart';
import 'package:kel7/helpers/utils/app_routes.dart';
import 'package:kel7/helpers/utils/locator.dart';
import 'package:kel7/helpers/utils/navigation_service.dart';
import 'package:kel7/helpers/widgets/loading_dialog.dart';
import 'package:kel7/models/loading.dart';
import 'package:kel7/screens/auth/forgot_password_screen.dart';
import 'package:kel7/screens/auth/register_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/widgets/my_button.dart';
import 'package:kel7/helpers/widgets/my_container.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:kel7/screens/features/app_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:kel7/bloc/register_bloc.dart';
import 'package:kel7/repositories/user_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");

  bool? _passwordUnvisible = true, _check = false;

  final _navService = locator<NavigationService>();

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();

    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  void dispose() {
    // _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (_, state) {
      if (state is LoginLoading) {
        // LoadingDialog.show(context, state.loading);
      } else if (state is LoginSuccess) {
        Loading loading = Loading(LoadingStatus.success, 'Login Berhasil', '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.home),
        );
      } else if (state is LoginFailure) {
        Loading loading = Loading(LoadingStatus.failed, state.error, '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.login),
        );
      }
    }, builder: (_, state) {
      return Scaffold(
          body: Stack(
        children: <Widget>[
          ClipPath(
              clipper: _MyCustomClipper(context),
              child: Container(
                alignment: Alignment.center,
                color: theme.colorScheme.background,
              )),
          Positioned(
            left: 30,
            right: 30,
            top: MediaQuery.of(context).size.height * 0.2,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                MyContainer.bordered(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  color: theme.scaffoldBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 24, top: 8),
                        child: MyText.titleLarge("LOGIN", fontWeight: 600),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailController,
                              style: MyTextStyle.bodyLarge(
                                  letterSpacing: 0.1,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: MyTextStyle.titleSmall(
                                    letterSpacing: 0.1,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: Icon(LucideIcons.mail),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                controller: _passwordController,
                                style: MyTextStyle.bodyLarge(
                                    letterSpacing: 0.1,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: MyTextStyle.titleSmall(
                                      letterSpacing: 0.1,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(_passwordUnvisible!
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff),
                                    onPressed: () {
                                      setState(() {
                                        _passwordUnvisible =
                                            !_passwordUnvisible!;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _passwordUnvisible!,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 16),
                                alignment: Alignment.centerRight,
                                child: MyText.bodyMedium("Lupa Password?",
                                    fontWeight: 500),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: theme.colorScheme.primary,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _check = value;
                                      });
                                    },
                                    value: _check,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  MyText(
                                    "Ingatkan saya",
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: MyButton.block(
                                  elevation: 0,
                                  borderRadiusAll: 4,
                                  padding: MySpacing.y(20),
                                  onPressed: () {
                                    final email = _emailController.text;
                                    final password = _passwordController.text;
// Dispatch login event to Bloc
                                    _loginBloc.add(ProsesLogin(
                                        email: email, password: password));
                                  },
                                  child: MyText.labelMedium("LOGIN",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary,
                                      letterSpacing: 0.5)),
                            ),
                            // Container(
                            //   margin: EdgeInsets.symmetric(vertical: 16),
                            //   child: Center(
                            //     child: MyText.bodyMedium("ATAU", fontWeight: 500),
                            //   ),
                            // ),
                            // MyButton.block(
                            //     elevation: 0,
                            //     borderRadiusAll: 4,
                            //     padding: MySpacing.y(20),
                            //     onPressed: () {
                            //       Navigator.pushReplacement(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => AppScreen()));
                            //     },
                            //     child: Row(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: <Widget>[
                            //         MyText.bodyLarge("Login menggunakan Google",
                            //             fontWeight: 600,
                            //             color: theme.colorScheme.onPrimary,
                            //             letterSpacing: 0.3),
                            //       ],
                            //     )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _navService.navigateTo(
                      AppRoutes.register,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Belum punya akun? ",
                              style: MyTextStyle.bodyMedium(fontWeight: 500)),
                          TextSpan(
                              text: " Registrasi",
                              style: MyTextStyle.bodyMedium(
                                  fontWeight: 600,
                                  color: theme.colorScheme.primary)),
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: MySpacing.safeAreaTop(context) + 12,
            left: 16,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ));
    });
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
