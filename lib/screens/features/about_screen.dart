import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/utils/generator.dart';
import 'package:kel7/helpers/widgets/my_button.dart';
import 'package:kel7/helpers/widgets/my_container.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: MySpacing.fromLTRB(20, 8, 20, 0),
            child: Image(
              image: AssetImage('./assets/full_logo.png'),
              height: 100,
            ),
          ),
          SizedBox(height: 30),
          MyText.bodySmall("Copyright by", fontWeight: 300),
          SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image(
                          image: AssetImage('./assets/profiles/avatar_2.png'),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 5),
                      MyText.bodyMedium("Rais Maududy", fontWeight: 300),
                    ],
                  ),
                  MyText.bodyMedium("23552012012", fontWeight: 300),
                ],
              )),
          SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image(
                          image: AssetImage('./assets/profiles/avatar_1.png'),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 5),
                      MyText.bodyMedium("Suci Nur Fa’iqoh", fontWeight: 300),
                    ],
                  ),
                  MyText.bodyMedium("21552011469", fontWeight: 300),
                ],
              )),
          SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image(
                          image: AssetImage('./assets/profiles/avatar_3.jpg'),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 5),
                      MyText.bodyMedium("Zaenal Arifin", fontWeight: 300),
                    ],
                  ),
                  MyText.bodyMedium("22552012028", fontWeight: 300),
                ],
              )),
          SizedBox(height: 10),
        ],
      ),
    ));
  }

  Widget singleCompleteWidget(
      {IconData? iconData,
      required String title,
      required String desc,
      required String option}) {
    return Container(
      padding: MySpacing.fromLTRB(20, 20, 20, 16),
      width: 220,
      decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: customTheme.border, width: 1)),
      child: Column(
        children: [
          Container(
            padding: MySpacing.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: theme.colorScheme.onBackground.withAlpha(120),
                    width: 1.5),
                shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: theme.colorScheme.onBackground.withAlpha(180),
              size: 26,
            ),
          ),
          Container(
            margin: MySpacing.top(12),
            child: MyText.bodyMedium(title,
                color: theme.colorScheme.onBackground,
                fontWeight: 600,
                letterSpacing: 0),
          ),
          Container(
            margin: MySpacing.top(4),
            child: MyText.bodySmall(
              desc,
              color: theme.colorScheme.onBackground,
              fontWeight: 400,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
          ),
          MySpacing.height(8),
          MyButton(
            borderRadiusAll: 4,
            elevation: 0,
            onPressed: () {},
            padding: MySpacing.fromLTRB(12, 8, 12, 8),
            child: MyText.bodySmall(option,
                color: theme.colorScheme.onPrimary, fontWeight: 600),
          ),
        ],
      ),
    );
  }
}
