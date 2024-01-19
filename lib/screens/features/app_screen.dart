import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/login_bloc.dart';
import 'package:kel7/helpers/utils/app_routes.dart';
import 'package:kel7/helpers/utils/locator.dart';
import 'package:kel7/helpers/utils/navigation_service.dart';
import 'package:kel7/helpers/widgets/loading_dialog.dart';
import 'package:kel7/models/loading.dart';
import 'package:kel7/screens/features/about_screen.dart';
import 'package:kel7/screens/features/activity_screen.dart';
import 'package:kel7/screens/features/home_screen.dart';
import 'package:kel7/screens/features/new_post_screen.dart';
import 'package:kel7/screens/features/search_screen.dart';
import 'package:kel7/screens/features/setting_screen.dart';
import 'package:kel7/helpers/theme/app_notifier.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/utils/my_shadow.dart';
import 'package:kel7/helpers/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  final _navService = locator<NavigationService>();

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;

    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (_, state) {
      if (state is LoginInitial) {
        Loading loading =
            Loading(LoadingStatus.success, 'Kembali Ke Halaman Login', '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.login),
        );
      }
    }, builder: (_, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
          bottomNavigationBar: BottomAppBar(
              elevation: 0,
              shape: CircularNotchedRectangle(),
              child: MyCard(
                color: theme.colorScheme.background,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                shadow: MyShadow(
                    position: MyShadowPosition.top, elevation: 2, alpha: 20),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: theme.colorScheme.primary,
                  tabs: <Widget>[
                    Container(
                      child: (_currentIndex == 0)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  LucideIcons.home,
                                  color: theme.colorScheme.primary,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              LucideIcons.home,
                              color: theme.colorScheme.onBackground,
                            ),
                    ),
                    Container(
                        child: (_currentIndex == 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    LucideIcons.search,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                LucideIcons.search,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        child: (_currentIndex == 2)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    LucideIcons.plusCircle,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                LucideIcons.plusCircle,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        child: (_currentIndex == 3)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    LucideIcons.user,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                LucideIcons.user,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        child: (_currentIndex == 4)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    LucideIcons.album,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                LucideIcons.album,
                                color: theme.colorScheme.onBackground,
                              )),
                  ],
                ),
              )),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              HomeScreen(),
              SearchScreen(),
              NewPostScreen(),
              SettingScreen(),
              AboutScreen()
            ],
          ),
        ),
      );
    });
  }
}
