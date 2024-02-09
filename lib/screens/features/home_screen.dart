import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/post_bloc.dart';
import 'package:kel7/models/post.dart';
import 'package:kel7/screens/features/profile_screen.dart';
import 'package:kel7/screens/features/status_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/theme/custom_theme.dart';
import 'package:kel7/helpers/utils/generator.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:kel7/screens/features/post_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:kel7/helpers/utils/time_ago.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _postBloc = context.read<PostBloc>();
    _postBloc.add(PostList());
  }

  @override
  void dispose() {
    // _postBloc.close();
    super.dispose();
  }

  final List<String> _simpleChoice = [
    "Laporkan",
    "Nyalakan pemberitahuan",
    "Salin Tautan",
    "Bagikan ...",
    "Berhenti mengikuti",
    "Senyapkan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {
              _postBloc.add(PostList());
            },
            child: ListView(
              padding: MySpacing.fromLTRB(
                  0, MySpacing.safeAreaTop(context) + 20, 0, 16),
              children: [
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: MySpacing.fromLTRB(16, 0, 6, 0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26)),
                              child: Image(
                                image: AssetImage(
                                    './assets/profiles/avatar_5.jpg'),
                                height: 52,
                                width: 52,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: -1,
                              right: -1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: customTheme.card, width: 1.4),
                                    shape: BoxShape.circle),
                                child: Container(
                                  padding: MySpacing.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: theme.colorScheme.primary,
                                  ),
                                  child: Icon(
                                    LucideIcons.plus,
                                    size: 12,
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      statusWidget(
                          image: './assets/profiles/avatar_4.jpg',
                          type: 2,
                          isLive: true),
                      statusWidget(
                          image: './assets/profiles/avatar_2.png', type: 1),
                      statusWidget(
                          image: './assets/profiles/avatar_1.png', type: 1),
                      statusWidget(
                          image: './assets/profiles/avatar_3.jpg', type: 2),
                      statusWidget(
                          image: './assets/profiles/avatar_4.jpg',
                          type: 2,
                          isMuted: true),
                      statusWidget(
                          image: './assets/profiles/avatar.png',
                          type: 2,
                          isMuted: true),
                    ],
                  ),
                ),
                Container(
                  margin: MySpacing.top(8),
                  child: Divider(
                    height: 0,
                  ),
                ),

                BlocBuilder<PostBloc, PostState>(
                    // bloc: context
                    //     .read<PostBloc>(), // provide the local bloc instance
                    builder: (context, state) {
                  if (state is PostLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PostloadedState) {
                    List<Widget> postList = <Widget>[];
                    for (var i = 0; i < state.postList.length; i++) {
                      postList.add(
                        postWidget(
                          post: state.postList[i],
                        ),
                      );
                    }
                    return Column(children: postList);
                    // return Column(children: [
                    //   ListView.builder(
                    //     itemCount: state.postList.length,
                    //     // padding: const EdgeInsets.symmetric(vertical: 15),
                    //     itemBuilder: (ctx, idx) => Text('state.postList[idx].desc!'),
                    //     // postWidget(
                    //     //     profileImage: './assets/profiles/avatar_1.png',
                    //     //     name: "Suci Nur Fa’iqoh",
                    //     //     status: "Purwakarta, Jawa Barat",
                    //     //     postImage: 'assets/profiles/profile_banner.jpg',
                    //     //     likes: "21 Menyukai",
                    //     //     time: '12 min'),
                    //   )
                    // ]);
                  } else if (state is InternetConnectionFailedState) {
                    return Container();
                  } else {
                    return const Center(
                      child: Text("Failed to get data"),
                    );
                  }
                }),
                // Column(
                //   children: [
                //     postWidget(
                //         profileImage: './assets/profiles/avatar_1.png',
                //         name: "Suci Nur Fa’iqoh",
                //         status: "Purwakarta, Jawa Barat",
                //         postImage: 'assets/profiles/profile_banner.jpg',
                //         likes: "21 Menyukai",
                //         time: '12 min'),
                //     Divider(
                //       height: 0,
                //     ),
                //     postWidget(
                //         profileImage: './assets/google.png',
                //         name: "Google",
                //         status: "Sponsored",
                //         postImage: './assets/posts/google-posts.jpg',
                //         likes: "Anda dan 7jt yang lainnya menyukai ini",
                //         time: 'Kemarin'),
                //     Divider(
                //       height: 0,
                //     ),
                //     postWidget(
                //         profileImage: './assets/profiles/avatar_2.png',
                //         name: "Rais Maududy",
                //         status: "Bandung, Jawa Barat",
                //         postImage: './assets/posts/post-l1.jpg',
                //         likes: "Anda dan 98 yang lainnya menyukai ini",
                //         time: 'Kemarin'),
                //     Divider(
                //       height: 0,
                //     ),
                //   ],
                // ),
                // Container(
                //   padding: EdgeInsets.only(
                //     top: 16,
                //   ),
                //   child: Center(
                //     child: SizedBox(
                //       width: 16,
                //       height: 16,
                //       child: CircularProgressIndicator(
                //           valueColor: AlwaysStoppedAnimation<Color>(
                //               theme.colorScheme.primary),
                //           strokeWidth: 1.4),
                //     ),
                //   ),
                // )
              ],
            )));
  }

  Widget statusWidget(
      {required String image,
      int type = 1,
      bool isLive = false,
      bool isMuted = false}) {
    return Opacity(
      opacity: isMuted ? 0.4 : 1,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StatusScreen()));
        },
        child: Container(
          padding: MySpacing.horizontal(6),
          child: Stack(
            children: [
              Container(
                padding: MySpacing.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: type == 2 ? customTheme.border : Colors.red,
                        width: 1.6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                  child: Image(
                    image: AssetImage(image),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              isLive
                  ? Positioned(
                      right: 0,
                      child: Container(
                        padding: MySpacing.fromLTRB(4, 2, 4, 2),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: MyText.bodySmall("Live",
                            color: Colors.white, fontSize: 9),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget postWidget({required Post post}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostScreen(
                      post: post,
                    )));
      },
      child: Container(
        margin: MySpacing.fromLTRB(0, 12, 0, 16),
        child: Column(
          children: [
            Container(
              margin: MySpacing.fromLTRB(16, 0, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.network(
                          post.user!.photo!,
                          width: 32,
                          height: 32,
                        )),
                  ),
                  Container(
                    margin: MySpacing.left(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall(post.user!.name!,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodySmall(post.location!,
                            fontSize: 12,
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: MyText.bodySmall(
                          timeAgo.stringTimeToTimeago(post.time!),
                          color: theme.colorScheme.onBackground,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(12),
              child: Image.network(
                post.img!,
                height: 240,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Generator.buildOverlaysProfile(
                      images: [
                        './assets/profiles/avatar_2.png',
                        './assets/profiles/avatar_5.jpg',
                        './assets/profiles/avatar_3.jpg',
                      ],
                      enabledOverlayBorder: true,
                      overlayBorderColor: customTheme.card,
                      overlayBorderThickness: 1.7,
                      leftFraction: 0.72,
                      size: 24),
                  Container(
                    margin: MySpacing.left(4),
                    child: MyText.bodySmall("${post.likes!}21 Menyukai",
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return _simpleChoice.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              height: 36,
                              child: MyText.bodyMedium(choice,
                                  color: theme.colorScheme.onBackground),
                            );
                          }).toList();
                        },
                        icon: Icon(
                          LucideIcons.moreVertical,
                          color: theme.colorScheme.onBackground,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MyText.bodyMedium("Novi Sulistiani",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 700),
                      Expanded(
                        child: Container(
                          margin: MySpacing.left(8),
                          child: MyText.bodySmall(
                            Generator.getDummyText(5, withEmoji: true),
                            color: theme.colorScheme.onBackground,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: MySpacing.top(4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText.bodyMedium("Firman Maulana",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 700),
                        Expanded(
                          child: Container(
                            margin: MySpacing.left(8),
                            child: MyText.bodySmall(
                              Generator.getDummyText(5, withEmoji: true),
                              color: theme.colorScheme.onBackground,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
