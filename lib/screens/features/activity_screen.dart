import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/utils/generator.dart';
import 'package:kel7/helpers/widgets/my_container.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
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
    return Scaffold(
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: MySpacing.left(24),
          child: Row(
            children: [
              Container(
                padding: MySpacing.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: theme.colorScheme.onBackground.withAlpha(140),
                        width: 1.5)),
                child: Icon(
                  LucideIcons.userPlus,
                  size: 24,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Container(
                margin: MySpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.titleSmall("Permintaan",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0),
                    MyText.bodySmall("Setujui atau abaikan permintaan",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        muted: true),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: MyText.bodyLarge("Hari ini",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: Row(
            children: [
              Generator.buildOverlaysProfile(
                  images: [
                    './assets/profiles/avatar_4.jpg',
                    './assets/profiles/avatar_3.jpg',
                  ],
                  size: 40,
                  leftFraction: 0.25,
                  topFraction: 0.25,
                  enabledOverlayBorder: true,
                  overlayBorderThickness: 1.5,
                  overlayBorderColor: customTheme.card),
              Expanded(
                child: Container(
                  margin: MySpacing.left(8),
                  child: RichText(
                    text: TextSpan(
                        style: MyTextStyle.bodyLarge(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        children: <TextSpan>[
                          TextSpan(
                              text: "edwin_septiana, arifinzn ",
                              style: MyTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600)),
                          TextSpan(
                              text: "dan ",
                              style: MyTextStyle.bodySmall(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 500)),
                          TextSpan(
                              text: "5 lainnya ",
                              style: MyTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600)),
                          TextSpan(
                              text: "mulai mengikuti anda. ",
                              style: MyTextStyle.bodySmall(
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 500)),
                          TextSpan(
                              text: " 2hr",
                              style: MyTextStyle.bodySmall(
                                  color: theme.colorScheme.onBackground,
                                  muted: true,
                                  letterSpacing: 0,
                                  fontWeight: 500)),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: MyText.bodyLarge("Terbaru",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              singleRecentWidget(
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Ikuti ",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500)),
                      TextSpan(
                          text: "Suci Nur Fa’iqoh, Oky Firmansyah ",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600)),
                      TextSpan(
                          text:
                              "dan orang lain yang Anda kenal untuk melihat foto dan videonya. ",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500)),
                      TextSpan(
                          text: "5mg",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                              fontWeight: 500)),
                    ]),
                  ),
                  image: './assets/profiles/avatar_1.png'),
              singleRecentWidget(
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Rais Maududy, Firman Maulana ",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600)),
                      TextSpan(
                          text: "dalam Community. Lihat postingan mereka. ",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500)),
                      TextSpan(
                          text: "10mg",
                          style: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                              fontWeight: 500)),
                    ]),
                  ),
                  image: './assets/profiles/avatar_2.png'),
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: MyText.bodyLarge("Saran",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              singleSuggestionWidget(
                  image: './assets/profiles/avatar_2.png',
                  name: "Rais Maududy",
                  username: "rais_maududy",
                  status: "Disarankan untuk Anda",
                  index: 0),
              singleSuggestionWidget(
                  image: './assets/profiles/avatar_4.jpg',
                  name: "Novi Sulistiani",
                  username: "novi_sulistiani",
                  status: "Disarankan untuk Anda",
                  index: 1),
              singleSuggestionWidget(
                  image: './assets/profiles/avatar.png',
                  name: "Aldi Permana Kusuma",
                  username: "aldy_permana",
                  status: "Populer",
                  index: 2),
              singleSuggestionWidget(
                  image: './assets/profiles/avatar_1.png',
                  name: "Suci Nur Fa’iqoh",
                  username: "sucinf",
                  status: "Populer",
                  index: 3),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleRecentWidget({required String image, RichText? text}) {
    return Container(
      margin: MySpacing.top(16),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              child: Image(
                image: AssetImage(image),
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Container(
              margin: MySpacing.left(16),
              child: text,
            ),
          )
        ],
      ),
    );
  }

  Widget singleSuggestionWidget(
      {required String image,
      required String name,
      required String username,
      required String status,
      required int index}) {
    return Container(
      margin: MySpacing.top(16),
      child: InkWell(
        onTap: () {
          //_showBottomSheet(context);
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              child: Image(
                image: AssetImage(image),
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: MySpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodyMedium(username,
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600),
                    MyText.bodySmall(
                      name,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      xMuted: true,
                      fontWeight: 600,
                      fontSize: 12,
                    ),
                    MyText.bodySmall(
                      status,
                      fontSize: 12,
                      color: theme.colorScheme.onBackground,
                      muted: true,
                      letterSpacing: 0,
                      fontWeight: 500,
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
            ),
            Container(
              margin: MySpacing.left(16),
              child: Icon(
                LucideIcons.x,
                size: 14,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
            )
          ],
        ),
      ),
    );
  }
}
