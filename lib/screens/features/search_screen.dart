import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/post_bloc.dart';
import 'package:kel7/models/post.dart';
import 'package:kel7/screens/features/post_screen.dart';
import 'package:kel7/screens/features/profile_screen.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/widgets/my_container.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  late PostBloc _postBloc;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _postBloc = context.read<PostBloc>();
    _postBloc.add(const PostList(search: ""));
  }

  @override
  void dispose() {
    // _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {
              _postBloc.add(PostList(search: searchController.text));
            },
            child: Padding(
                padding: MySpacing.fromLTRB(
                    10, MySpacing.safeAreaTop(context) + 20, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: MySpacing.fromLTRB(0, 0, 0, 10),
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
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
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
                              color:
                                  theme.colorScheme.onBackground.withAlpha(220),
                            )),
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                        controller: searchController,
                        onFieldSubmitted: (value) {
                          _postBloc
                              .add(PostList(search: searchController.text));
                        },
                      ),
                    ),
                    // Container(
                    //   margin: MySpacing.top(8),
                    //   child: Divider(
                    //     height: 0,
                    //   ),
                    // ),
                    Expanded(child: BlocBuilder<PostBloc, PostState>(
                        // bloc: context
                        //     .read<PostBloc>(), // provide the local bloc instance
                        builder: (context, state) {
                      if (state is PostLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is PostloadedState) {
                        return MasonryGridView.builder(
                          padding: EdgeInsets.all(0),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          // gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                          //   maxCrossAxisExtent: 150,
                          // ),
                          itemCount: state.postList.length,
                          itemBuilder: (context, index) {
                            return imageWidget(state.postList[index]);
                          },
                        );
                      } else if (state is InternetConnectionFailedState) {
                        return Container();
                      } else {
                        return const Center(
                          child: Text("Failed to get data"),
                        );
                      }
                    })),
                  ],
                ))));
  }

  Widget imageWidget(Post post) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostScreen(
                        post: post,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            post.img!,
            scale: 1,
            fit: BoxFit.cover,
          ),
        ));
  }
}
