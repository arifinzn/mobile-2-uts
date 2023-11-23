import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/app_buttons.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/helpers/theme_icon.dart';
import 'package:kel7/helpers/timer_view.dart';

class AppUtil {
  static showToast({required String message, required bool isSuccess}) {
    Get.snackbar(isSuccess == true ? successString.tr : errorString.tr, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: isSuccess == true
            ? AppConstants.themeColor.darken()
            : AppConstants.red.lighten(),
        icon: Icon(Icons.error, color: AppConstants.iconColor));
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Widget addProgressIndicator({double? size}) {
    return Center(
        child: SizedBox(
      width: size ?? 50,
      height: size ?? 50,
      child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation<Color>(AppConstants.themeColor)),
    ));
  }

  Future<bool> check() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   return true;
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
    // }
    // return false;
  }

  static Future<bool> checkInternet() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   return true;
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
    // }
    // return false;
  }

  static void showConfirmationAlert(
      {required String title,
      required String subTitle,
      required VoidCallback okHandler}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 200,
            width: Get.width,
            color: AppConstants.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading3Text(
                  title,
                  color: AppConstants.themeColor,
                  weight: TextWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Heading6Text(
                  subTitle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: AppThemeBorderButton(
                              text: yesString.tr,
                              onPress: () {
                                Get.back(closeOverlays: true);
                                okHandler();
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: AppThemeButton(
                              text: noString.tr,
                              onPress: () {
                                Get.back(closeOverlays: true);
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ).hp(AppConstants.horizontalPadding),
          ).round(20),
        );
      },
    );
  }

  static void showNewConfirmationAlert(
      {required String title,
      required String subTitle,
      required VoidCallback okHandler,
      required VoidCallback cancelHandler}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => Container(
        height: 220,
        width: Get.width,
        color: AppConstants.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading3Text(
              title,
              color: AppConstants.themeColor,
              weight: TextWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            BodyLargeText(
              subTitle,
              weight: TextWeight.regular,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Wrap(
                  spacing: 20,
                  children: [
                    BodyLargeText(
                      okString.tr,
                      color: AppConstants.grayscale100,
                    )
                        .makeChip(backGroundColor: AppConstants.grayscale900)
                        .ripple(() {
                      Get.back(closeOverlays: true);
                      okHandler();
                    }),
                    BodyLargeText(
                      cancelString.tr,
                      color: Colors.white,
                    ).makeChip(backGroundColor: AppConstants.red).ripple(() {
                      cancelHandler();
                      Get.back(closeOverlays: true);
                    }),
                  ],
                ),
              ],
            )
          ],
        ).hp(AppConstants.horizontalPadding),
      ).round(20),
    );
  }

  static void showNewConfirmationAlertWithTimer(
      {required String title,
      required String subTitle,
      required int time,
      required VoidCallback okHandler,
      required VoidCallback cancelHandler}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => Container(
        height: 220,
        width: Get.width,
        color: AppConstants.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 30,
                width: 120,
                color: AppConstants.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ThemeIconWidget(
                      ThemeIcon.clock,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Center(
                        child: UnlockTimerView(
                      unlockTime: time,
                      completionHandler: () {
                        Get.back(closeOverlays: true);
                        // cancelHandler();
                      },
                    )),
                  ],
                ).hP4,
              ).bottomRounded(10),
            ),
            const SizedBox(
              height: 20,
            ),
            Heading3Text(
              title,
              color: AppConstants.themeColor,
              weight: TextWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            BodyLargeText(
              subTitle,
              weight: TextWeight.regular,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Wrap(
                  spacing: 20,
                  children: [
                    BodyLargeText(
                      acceptString.tr,
                      color: AppConstants.grayscale100,
                    )
                        .makeChip(backGroundColor: AppConstants.grayscale900)
                        .ripple(() {
                      Get.back(closeOverlays: true);
                      okHandler();
                    }),
                    BodyLargeText(
                      declineString,
                      color: Colors.white,
                    ).makeChip(backGroundColor: AppConstants.red).ripple(() {
                      cancelHandler();
                      Get.back(closeOverlays: true);
                    }),
                  ],
                ),
              ],
            )
          ],
        ).hp(AppConstants.horizontalPadding),
      ).round(20),
    );
  }

  static void showDemoAppConfirmationAlert(
      {required String title,
      required String subTitle,
      required VoidCallback okHandler}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 200,
            width: Get.width,
            color: AppConstants.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading3Text(
                  title,
                  color: AppConstants.themeColor,
                  weight: TextWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                BodyLargeText(
                  subTitle,
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          height: 30,
                          child: AppThemeBorderButton(
                              text: okString.tr,
                              onPress: () {
                                Get.back(closeOverlays: true);
                                okHandler();
                              }),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ).p16,
          ).round(20),
        );
      },
    );
  }
}

class TimeAgo {
  static String timeAgoSinceDate(DateTime timeAgoDate,
      {bool numericDates = true}) {
    final difference = DateTime.now().difference(timeAgoDate);

    if (difference.inDays > 8) {
      int days = difference.inDays;
      if (days > 365) {
        //Years
        int years = (days / 365).round();

        return years >= 2
            ? '$years ${monthsAgoString.tr}'
            : '$years ${monthAgoString.tr}';
      } else if (days > 30) {
        int months = (days / 30).round();
        return months >= 2
            ? '$months ${monthsAgoString.tr}'
            : '$months ${monthAgoString.tr}';
      } else {
        return '${(difference.inDays / 7).floor()} ${weekAgoString.tr}';
      }
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 ${weekAgoString.tr}' : lastWeekString.tr;
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ${daysAgoString.tr}';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 ${dayAgoString.tr}' : yesterdayString.tr;
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} ${hoursAgoString.tr}';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 ${hoursAgoString.tr}' : anHourAgoString.tr;
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} ${minutesAgoString.tr}';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 ${minutesAgoString.tr}' : aMinuteAgoString.tr;
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} ${secondsAgoString.tr}';
    } else {
      return justNowString.tr;
    }
  }
}
