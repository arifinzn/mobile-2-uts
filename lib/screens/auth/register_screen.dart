import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/register_bloc.dart';
import 'package:kel7/helpers/theme/custom_theme.dart';
import 'package:kel7/helpers/utils/app_routes.dart';
import 'package:kel7/helpers/utils/locator.dart';
import 'package:kel7/helpers/utils/navigation_service.dart';
import 'package:kel7/helpers/widgets/loading_dialog.dart';
import 'package:kel7/models/loading.dart';
import 'package:kel7/screens/auth/login_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/widgets/my_button.dart';
import 'package:kel7/helpers/widgets/my_container.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:kel7/screens/features/app_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc _registerBloc;
  final _navService = locator<NavigationService>();

  TextEditingController _npmController = TextEditingController(text: "");
  TextEditingController _nameController = TextEditingController(text: "");
  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _phoneController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");
  TextEditingController _passwordConfirmController =
      TextEditingController(text: "");

  bool _passwordUnvisible = true;
  bool _passwordConfirmUnvisible = true;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _registerBloc = context.read<RegisterBloc>();
  }

  @override
  void dispose() {
    _registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(listener: (_, state) {
      if (state is RegisterLoading) {
        // LoadingDialog.show(context, state.loading);
      } else if (state is RegisterSuccess) {
        Loading loading =
            Loading(LoadingStatus.success, 'Registrasi Berhasil', '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.home),
        );
      } else if (state is RegisterFailure) {
        Loading loading = Loading(LoadingStatus.failed, state.error, '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.register),
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
            top: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: <Widget>[
                MyContainer.bordered(
                  color: theme.scaffoldBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: MyText.titleLarge("REGISTRASI", fontWeight: 600),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                controller: _npmController,
                                decoration: InputDecoration(
                                  hintText: "NPM",
                                  hintStyle: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.user),
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "Nama",
                                  hintStyle: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.user),
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.mail),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  hintText: "No Telepon",
                                  hintStyle: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.phone),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(_passwordUnvisible
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff),
                                    onPressed: () {
                                      setState(() {
                                        _passwordUnvisible =
                                            !_passwordUnvisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _passwordUnvisible,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                controller: _passwordConfirmController,
                                decoration: InputDecoration(
                                  hintText: "Konfirmasi Password",
                                  hintStyle: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: Icon(LucideIcons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(_passwordConfirmUnvisible
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff),
                                    onPressed: () {
                                      setState(() {
                                        _passwordConfirmUnvisible =
                                            !_passwordConfirmUnvisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _passwordConfirmUnvisible,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 24),
                                child: MyButton(
                                    elevation: 0,
                                    borderRadiusAll: 4,
                                    onPressed: () {
                                      final email = _emailController.text;
                                      final npm = _npmController.text;
                                      final name = _nameController.text;
                                      final phone = _phoneController.text;
                                      final password = _passwordController.text;
                                      final passwordConfirm =
                                          _passwordConfirmController.text;

                                      if (npm.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: 'NPM tidak boleh kosong',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (email.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: 'Email tidak boleh kosong',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (name.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: 'Nama tidak boleh kosong',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (password.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: 'Password tidak boleh kosong',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (passwordConfirm.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg:
                                                'Konfirmasi password tidak boleh kosong',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (password != passwordConfirm) {
                                        Fluttertoast.showToast(
                                            msg:
                                                'Password dan konfirmasi password tidak sama!',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else {
                                        _registerBloc.add(ProsesRegister(
                                                npm: npm,
                                                name: name,
                                                email: email,
                                                phone: phone,
                                                password: password)

// Dispatch login event to Bloc

                                            );
                                      }
                                    },
                                    padding: MySpacing.xy(20, 20),
                                    child: MyText.labelMedium("REGISTRASI",
                                        fontWeight: 600,
                                        color: theme.colorScheme.onPrimary))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _navService.navigateTo(
                      AppRoutes.login,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Sudah punya akun? ",
                            style: MyTextStyle.bodyMedium(fontWeight: 500)),
                        TextSpan(
                            text: " Login",
                            style: MyTextStyle.bodyMedium(
                                fontWeight: 600,
                                color: theme.colorScheme.primary)),
                      ]),
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
