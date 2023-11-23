import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/app_buttons.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/helpers/theme_icon.dart';
import 'package:kel7/widgets/common_widgets.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      itemCount: 20,
      itemBuilder: (ctx, index) {
        return const PostCardShimmer().hp(AppConstants.horizontalPadding);
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}

class ClubsCategoriesScreenShimmer extends StatelessWidget {
  const ClubsCategoriesScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.separated(
            padding: EdgeInsets.only(left: AppConstants.horizontalPadding),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext ctx, int index) {
              return SizedBox(
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      height: Get.height,
                      width: Get.width,
                      color: AppConstants.cardColor,
                    ),
                    Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: BodyMediumText('Sports',
                            weight: TextWeight.semiBold))
                  ],
                ),
              ).round(5).addShimmer();
            },
            separatorBuilder: (BuildContext ctx, int index) {
              return const SizedBox(
                width: 10,
              );
            }));
  }
}

class ClubsScreenShimmer extends StatelessWidget {
  const ClubsScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(
            left: AppConstants.horizontalPadding,
            right: AppConstants.horizontalPadding),
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            height: 320,
            color: AppConstants.cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    width: Get.width,
                    height: double.infinity,
                    color: AppConstants.cardColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Heading6Text(
                  'Club name',
                  weight: TextWeight.medium,
                ).p8,
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BodyLargeText(
                      '250k ${clubMembersString.tr}',
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 40,
                        width: 120,
                        child:
                            AppThemeButton(text: joinString.tr, onPress: () {}))
                  ],
                ).setPadding(left: 12, right: 12, bottom: 20)
              ],
            ),
          ).round(15).addShimmer();
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return const SizedBox(
            height: 25,
          );
        });
  }
}

class EventCategoriesScreenShimmer extends StatelessWidget {
  const EventCategoriesScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(left: AppConstants.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return Row(
            children: [
              Container(
                color: AppConstants.cardColor,
                height: 30,
                width: 30,
              ).circular,
              const SizedBox(
                width: 10,
              ),
              BodyMediumText(loadingString.tr, weight: TextWeight.semiBold)
            ],
          )
              .setPadding(left: 8, right: 8, top: 4, bottom: 4)
              .borderWithRadius(value: 1, radius: 20);
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return const SizedBox(
            width: 10,
          );
        });
  }
}

class EventsScreenShimmer extends StatelessWidget {
  const EventsScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 5 * 350,
          child: ListView.separated(
              padding: EdgeInsets.only(
                  left: AppConstants.horizontalPadding,
                  right: AppConstants.horizontalPadding),
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  // width: 250,
                  height: 320,
                  color: AppConstants.cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          width: Get.width,
                          height: double.infinity,
                          color: AppConstants.cardColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Heading6Text(
                        'Club name',
                        weight: TextWeight.medium,
                      ).p8,
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BodyLargeText(
                            '250k ${clubMembersString.tr}',
                          ),
                          const Spacer(),
                          SizedBox(
                              height: 40,
                              width: 120,
                              child: AppThemeButton(
                                  text: joinString.tr, onPress: () {}))
                        ],
                      ).setPadding(left: 12, right: 12, bottom: 20)
                    ],
                  ),
                ).round(15).addShimmer();
              },
              separatorBuilder: (BuildContext ctx, int index) {
                return const SizedBox(
                  height: 25,
                );
              }),
        ),
      ],
    ).bP16;
  }
}

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/account.png'))
              .addShimmer(),
          const SizedBox(width: 5),
          Expanded(
              child: BodyLargeText(
            'Adam',
            weight: TextWeight.bold,
            color: AppConstants.themeColor,
          ).addShimmer()),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 280,
        width: double.infinity,
        child: Image.asset(
          'assets/tutorial1.jpg',
          fit: BoxFit.cover,
        ).addShimmer(),
      ).round(20),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ThemeIconWidget(
            ThemeIcon.message,
            color: AppConstants.iconColor,
          ),
          const SizedBox(
            width: 5,
          ),
          BodyLargeText(
            '10k',
            weight: TextWeight.bold,
            color: AppConstants.themeColor,
          ).ripple(() {})
        ]),
        const SizedBox(
          width: 10,
        ),
        ThemeIconWidget(ThemeIcon.favFilled, color: AppConstants.red),
        const SizedBox(
          width: 5,
        ),
        BodyLargeText('205k', weight: TextWeight.bold),
      ]).vP16.addShimmer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyLargeText(
              'Lorem ipsum dolor sit amet. Et ipsa libero est dolor facilis qui distinctio neque. Sed dolorum accusamus qui tempora doloremque et suscipit quidem et voluptate'),
          const SizedBox(
            height: 10,
          ),
          BodyMediumText('10 min ago', weight: TextWeight.medium),
        ],
      ).addShimmer()
    ]);
  }
}

class StoryAndHighlightsShimmer extends StatelessWidget {
  const StoryAndHighlightsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
          padding: EdgeInsets.only(left: AppConstants.horizontalPadding),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext ctx, int index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  color: AppConstants.backgroundColor,
                ).round(10),
                const SizedBox(
                  height: 5,
                ),
                const BodyLargeText('Adam')
              ],
            ).addShimmer();
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return const SizedBox(width: 10);
          }),
    );
  }
}

class ShimmerUsers extends StatelessWidget {
  const ShimmerUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
          left: AppConstants.horizontalPadding,
          right: AppConstants.horizontalPadding,
          top: 20,
          bottom: 100),
      itemCount: 20,
      itemBuilder: (ctx, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: AppConstants.themeColor,
                ).round(10).addShimmer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading5Text(
                      'Adam',
                      weight: TextWeight.medium,
                    ).bP4,
                    const BodyLargeText(
                      'Canada',
                    )
                  ],
                ).lP16.addShimmer(),
              ],
            ),
            SizedBox(
              height: 35,
              width: 110,
              child: AppThemeBorderButton(
                  // backgroundColor: ColorConstants.cardColor,
                  text: followString.tr,
                  // cornerRadius: 10,
                  textStyle: TextStyle(
                      fontSize: FontSizes.b2, fontWeight: TextWeight.medium),
                  onPress: () {}),
            ).addShimmer()
          ],
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}

class ShimmerHashtag extends StatelessWidget {
  const ShimmerHashtag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return Row(
            children: [
              const SizedBox(
                height: 40,
                width: 40,
                child: Center(
                    child: Heading3Text(
                  '#',
                )),
              ).borderWithRadius(value: 0.5, radius: 20).addShimmer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading5Text(
                    '#fun',
                    weight: TextWeight.medium,
                  ).bP4,
                  const BodyLargeText(
                    '210k posts',
                  )
                ],
              ).hp(AppConstants.horizontalPadding).addShimmer(),
            ],
          ).vP16;
        });
  }
}

class PostBoxShimmer extends StatelessWidget {
  const PostBoxShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: AppConstants.red,
        ).round(10).addShimmer(),
      ),
    ).hp(AppConstants.horizontalPadding);
  }
}

class StoriesShimmerWidget extends StatelessWidget {
  const StoriesShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.6,
            crossAxisCount: 3),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: AppConstants.backgroundColor,
          ).round(10).addShimmer();
        }).hp(AppConstants.horizontalPadding);
  }
}

class EventBookingShimmerWidget extends StatefulWidget {
  const EventBookingShimmerWidget({Key? key}) : super(key: key);

  @override
  State<EventBookingShimmerWidget> createState() =>
      _EventBookingShimmerWidgetState();
}

class _EventBookingShimmerWidgetState extends State<EventBookingShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(
            top: 16,
            left: AppConstants.horizontalPadding,
            right: AppConstants.horizontalPadding,
            bottom: 16),
        itemCount: 20,
        itemBuilder: (BuildContext ctx, int index) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Heading6Text('National music festival',
                        weight: TextWeight.semiBold),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: AppConstants.cardColor,
                  ).round(10)
                ],
              ).p16,
              divider().vP8,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyMediumText(
                        dateString.tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                        width: 30,
                        color: AppConstants.themeColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BodyLargeText('10-Nov-2022', weight: TextWeight.semiBold)
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyMediumText(
                        timeString.tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                        width: 30,
                        color: AppConstants.themeColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BodyLargeText('10:00 AM', weight: TextWeight.semiBold)
                    ],
                  ),
                  const Spacer(),
                  Container(
                    color: AppConstants.backgroundColor,
                    child: const BodyMediumText(
                      'VIP',
                    ).setPadding(
                        left: AppConstants.horizontalPadding,
                        right: AppConstants.horizontalPadding,
                        top: 8,
                        bottom: 8),
                  ).round(10)
                ],
              ).p16
            ],
          ).addShimmer();
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return const SizedBox(
            height: 20,
          );
        });
  }
}

class ShimmerMatchedList extends StatelessWidget {
  const ShimmerMatchedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            mainAxisExtent: 210),
        itemBuilder: (ctx, index) {
          return Container(
                  color: AppConstants.cardColor,
                  height: 210,
                  width: (MediaQuery.of(context).size.width - 75) / 2)
              .round(10);
        }).addShimmer();
  }
}

class ShimmerLikeList extends StatelessWidget {
  const ShimmerLikeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: AppConstants.cardColor,
          ).round(10).setPadding(bottom: 15, left: 15, right: 15);
        }).addShimmer();
  }
}
