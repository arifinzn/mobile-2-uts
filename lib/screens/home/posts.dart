import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/widgets/post_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:kel7/controllers/post_controller.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/theme_icon.dart';
import 'package:kel7/models/post_model.dart';
import 'package:kel7/widgets/shimmer_widgets.dart';

class Posts extends StatefulWidget {
  final String? hashTag;
  final int? userId;
  final int? locationId;
  final List<PostModel>? posts;
  final int? index;
  final int? page;
  final int? totalPages;

  const Posts(
      {Key? key,
      this.page,
      this.totalPages,
      this.hashTag,
      this.userId,
      this.locationId,
      this.posts,
      this.index})
      : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final PostController _postController = Get.find();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _postController.addPosts(
          widget.posts ?? [], widget.page, widget.totalPages);

      // loadData();
      if (widget.index != null) {
        Future.delayed(const Duration(milliseconds: 200), () {
          itemScrollController.jumpTo(
            index: widget.index!,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThemeIconWidget(
                  ThemeIcon.backArrow,
                  color: AppConstants.iconColor,
                  size: 25,
                ).ripple(() {
                  Get.back();
                }),
                const Spacer(),
                // Image.asset(
                //   'assets/logo.png',
                //   width: 80,
                //   height: 25,
                // ),
                const Spacer(),
                ThemeIconWidget(
                  ThemeIcon.notification,
                  color: AppConstants.iconColor,
                  size: 25,
                ).ripple(() {
                  // Get.to(() => const NotificationsScreen());
                }),
              ],
            ).hp(20),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: postsView()),
          ],
        ));
  }

  postsView() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _postController.getPosts(() {});
      }
    });

    return GetBuilder<PostController>(
        init: _postController,
        builder: (ctx) {
          List<PostModel> posts = _postController.posts;

          return _postController.postDataWrapper.isLoading.value
              ? const HomeScreenShimmer()
              : posts.isEmpty
                  ? Center(child: BodyLargeText(noDataString.tr))
                  : ScrollablePositionedList.builder(
                      itemScrollController: itemScrollController,
                      itemPositionsListener: itemPositionsListener,
                      padding: const EdgeInsets.only(top: 10, bottom: 50),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        PostModel model = posts[index];
                        return Column(
                          children: [
                            PostCard(
                                model: model,
                                removePostHandler: () {
                                  _postController.removePostFromList(model);
                                },
                                blockUserHandler: () {
                                  _postController
                                      .removeUsersAllPostFromList(model);
                                }),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      },
                    );
        });
  }
}
