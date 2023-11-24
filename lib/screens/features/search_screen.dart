import 'package:kel7/screens/features/profile_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/widgets/my_container.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _list = List.generate(6, (index) => false);
  }

  late List<bool> _list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: MySpacing.fromLTRB(24, 0, 24, 0),
          child: TextFormField(
            style: MyTextStyle.bodyMedium(
                letterSpacing: 0,
                color: theme.colorScheme.onBackground,
                fontWeight: 500),
            decoration: InputDecoration(
                hintText: "Pencarian ...",
                hintStyle: MyTextStyle.bodyMedium(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                fillColor: customTheme.card,
                filled: true,
                isDense: true,
                prefixIcon: Icon(
                  LucideIcons.search,
                  size: 16,
                  color: theme.colorScheme.onBackground.withAlpha(220),
                )),
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium("Terbaru",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
              MyText.bodyMedium("Bersihkan",
                  color: theme.colorScheme.primary, fontWeight: 600),
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(0, 12, 0, 0),
          child: Row(
            children: [
              Container(
                margin: MySpacing.left(24),
                child: searchRecentItem(
                  image: './assets/profiles/avatar_1.png',
                  name: 'Suci Nur Fa’iqoh',
                  isActive: true,
                ),
              ),
              Container(
                margin: MySpacing.left(16),
                child: searchRecentItem(
                  image: './assets/profiles/avatar_2.png',
                  name: 'Rais Maududy',
                  isActive: true,
                ),
              ),
              Container(
                margin: MySpacing.left(16),
                child: searchRecentItem(
                  image: './assets/profiles/avatar_3.jpg',
                  name: 'Zaenal Arifin',
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(16, 0, 24, 0),
                child: searchRecentItem(
                  image: './assets/profiles/avatar_4.jpg',
                  name: 'Novi Sulistiani',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: MyText.bodyMedium("Hasil",
              color: theme.colorScheme.onBackground, fontWeight: 700),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              searchResultItem(
                  index: 5,
                  image: './assets/profiles/avatar.png',
                  name: 'Aldi permana kusuma',
                  isActive: true,
                  status: "@aldi_permana"),
              searchResultItem(
                  index: 0,
                  image: './assets/profiles/avatar_2.png',
                  isActive: true,
                  name: 'Rais Maududy',
                  status: "@rais_maududy"),
              searchResultItem(
                  index: 1,
                  image: './assets/profiles/avatar_1.png',
                  name: 'Suci Nur Fa’iqoh',
                  status: "@sucinf"),
              searchResultItem(
                  index: 2,
                  image: './assets/profiles/avatar_3.jpg',
                  name: 'Zaenal Arifin',
                  status: "@arifinzn"),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchResultItem(
      {required String image,
      required int index,
      required String name,
      required String status,
      bool isActive = false}) {
    return Container(
      margin: MySpacing.top(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: Image(
                    image: AssetImage(image),
                    height: 44,
                    width: 44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: customTheme.card, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: customTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Expanded(
              child: Container(
                margin: MySpacing.left(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodyLarge(name,
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    MyText.bodySmall(
                      status,
                      fontSize: 12,
                      color: theme.colorScheme.onBackground.withAlpha(160),
                      fontWeight: 600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _list[index] = !_list[index];
                });
              },
              child: MyContainer(
                padding: MySpacing.fromLTRB(16, 8, 16, 8),
                bordered: _list[index],
                borderRadiusAll: 4,
                border: Border.all(color: customTheme.border, width: 1),
                color: _list[index]
                    ? Colors.transparent
                    : theme.colorScheme.primary,
                child: MyText.bodySmall(_list[index] ? "Mengikuti" : "Ikuti",
                    color: _list[index]
                        ? theme.colorScheme.onBackground
                        : theme.colorScheme.onPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.3),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchRecentItem(
      {required String image, required String name, bool isActive = false}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: Image(
                  image: AssetImage(image),
                  height: 44,
                  width: 44,
                  fit: BoxFit.cover,
                ),
              ),
              isActive
                  ? Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: customTheme.card, width: 2),
                            shape: BoxShape.circle),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: customTheme.colorSuccess,
                              shape: BoxShape.circle),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Container(
            margin: MySpacing.top(8),
            child: MyText.bodySmall(name,
                letterSpacing: 0,
                color: theme.colorScheme.onBackground,
                muted: true,
                fontWeight: 500),
          )
        ],
      ),
    );
  }
}
