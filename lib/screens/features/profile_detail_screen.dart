import 'package:kel7/screens/features/relationship_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/widgets/my_button.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final List<String> _imageList = [
    './assets/posts/all-1.jpg',
    './assets/posts/all-2.jpg',
    './assets/posts/all-3.jpg',
    './assets/posts/all-4.jpg',
    './assets/posts/all-5.jpg',
    './assets/posts/all-6.jpg',
    './assets/posts/all-7.jpg',
    './assets/posts/all-8.jpg',
    './assets/posts/all-9.jpg',
    './assets/posts/all-10.jpg',
    './assets/posts/all-11.jpg',
    './assets/posts/all-12.jpg',
    './assets/posts/all-13.jpg',
    './assets/posts/all-14.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    int size = 11;
    for (int i = 0; i < size; i++) {
      list.add(Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
      ));
    }
    list.add(InkWell(
      splashColor: theme.colorScheme.primary.withAlpha(100),
      highlightColor: theme.colorScheme.primary.withAlpha(28),
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(28),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
          child: MyText.titleSmall("Lihat Semua",
              color: theme.colorScheme.primary, fontWeight: 600),
        ),
      ),
    ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ),
        body: ListView(
          padding: MySpacing.zero,
          children: [
            Container(
              margin: MySpacing.fromLTRB(24, 0, 24, 0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image(
                      image: AssetImage('./assets/profiles/avatar_3.jpg'),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Container(
                    margin: MySpacing.left(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyLarge("Surya Kusumadinata",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                        MyText.bodyMedium("12 April",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            muted: true)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  MyButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RelationshipScreen()));
                    },
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: MyText.bodyMedium("Hubungkan",
                        fontWeight: 500, color: theme.colorScheme.onPrimary),
                  ),
                  Container(
                    margin: MySpacing.left(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("105rb",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodySmall("Pengikut",
                            color: theme.colorScheme.onBackground, muted: true),
                      ],
                    ),
                  ),
                  Container(
                    margin: MySpacing.left(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("45",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                        MyText.bodySmall("Mengikuti",
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 24, 0, 0),
              child: MyText.titleMedium("Postingan",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: GridView.count(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: MySpacing.fromLTRB(24, 12, 24, 24),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: _generateGridItems()),
            )
          ],
        ));
  }
}
