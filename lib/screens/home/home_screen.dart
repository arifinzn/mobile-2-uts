import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/controllers/settings_controller.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/helpers/theme_icon.dart';
import 'package:kel7/screens/home/home_feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final DashboardController _dashboardController = Get.find();
  final SettingsController _settingsController = Get.find();

  List<Widget> items = [];
  // final picker = ImagePicker();
  bool hasPermission = false;

  @override
  void initState() {
    items = [
      const HomeFeedScreen(),
      // const Explore(),
      // const WatchVideos(),
      // const ChatHistory(),
      // const MyProfile(
      //   showBack: false,
      // ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _dashboardController.isLoading.value == true
        ? SizedBox(
            height: Get.height,
            width: Get.width,
            child: const Center(child: CircularProgressIndicator()),
          )
        // : _settingsController.forceUpdate.value == true ? ForceUpdateView()
        : _settingsController.appearanceChanged?.value == null
            ? Container()
            : Scaffold(
                backgroundColor: AppConstants.backgroundColor,
                body: items[_dashboardController.currentIndex.value],
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom > 0
                      ? 100
                      : 80.0,
                  width: Get.width,
                  child: BottomNavigationBar(
                    backgroundColor: AppConstants.backgroundColor,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _dashboardController.currentIndex.value,
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: AppConstants.themeColor,
                    onTap: (index) => {onTabTapped(index)},
                    items: [
                      BottomNavigationBarItem(
                          icon: Obx(() => ThemeIconWidget(
                                ThemeIcon.home,
                                size: 28,
                                color:
                                    _dashboardController.currentIndex.value == 0
                                        ? AppConstants.themeColor
                                        : AppConstants.iconColor,
                              ).bP8),
                          label: homeString.tr),
                      BottomNavigationBarItem(
                        icon: Obx(() => Stack(
                              children: [
                                Obx(() => ThemeIconWidget(
                                      ThemeIcon.search,
                                      size: 28,
                                      color: _dashboardController
                                                  .currentIndex.value ==
                                              1
                                          ? AppConstants.themeColor
                                          : AppConstants.iconColor,
                                    ).bP8),
                                if (_dashboardController.unreadMsgCount.value >
                                    0)
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        color: AppConstants.themeColor,
                                      ).circular)
                              ],
                            )),
                        label: exploreString.tr,
                      ),
                      BottomNavigationBarItem(
                        icon: Obx(() => ThemeIconWidget(
                              ThemeIcon.videoPost,
                              size: 28,
                              color:
                                  _dashboardController.currentIndex.value == 2
                                      ? AppConstants.themeColor
                                      : AppConstants.iconColor,
                            ).bP8),
                        label: videoString.tr,
                      ),
                      BottomNavigationBarItem(
                        icon: Obx(() => ThemeIconWidget(
                              ThemeIcon.chat,
                              size: 28,
                              color:
                                  _dashboardController.currentIndex.value == 3
                                      ? AppConstants.themeColor
                                      : AppConstants.iconColor,
                            ).bP8),
                        label: chatsString.tr,
                      ),
                      BottomNavigationBarItem(
                        icon: Obx(() => ThemeIconWidget(
                              ThemeIcon.account,
                              size: 28,
                              color:
                                  _dashboardController.currentIndex.value == 4
                                      ? AppConstants.themeColor
                                      : AppConstants.iconColor,
                            ).bP8),
                        label: accountString.tr,
                      ),
                    ],
                  ),
                )));
  }

  void onTabTapped(int index) async {
    Future.delayed(
        Duration.zero, () => _dashboardController.indexChanged(index));
  }
}

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt unreadMsgCount = 0.obs;
  RxBool isLoading = false.obs;

  indexChanged(int index) {
    currentIndex.value = index;
  }

  updateUnreadMessageCount(int count) {
    unreadMsgCount.value = count;
  }
}
