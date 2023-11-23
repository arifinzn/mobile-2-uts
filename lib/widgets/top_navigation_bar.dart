import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/theme_icon.dart';

Widget backNavigationBar({required String title}) {
  return Container(
    height: 100,
    width: Get.width,
    color: AppConstants.themeColor.withOpacity(0.1),
    child: Stack(
      children: [
        Container(
          color: AppConstants.themeColor.withOpacity(0.4),
          height: 40,
          width: 40,
          child: Center(
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ).lP8.ripple(() {
              Get.back();
            }),
          ).p8,
        ).circular,
        Positioned(
          left: 50,
          right: 50,
          top: 10,
          child: Center(
              child: BodyLargeText(title.tr,
                  maxLines: 1, weight: TextWeight.medium)),
        )
      ],
    ).setPadding(
        left: AppConstants.horizontalPadding,
        right: AppConstants.horizontalPadding,
        top: 40),
  );
}

Widget backNavigationBarWithIcon(
    {required ThemeIcon icon,
    required String title,
    Color? iconColor,
    required VoidCallback iconBtnClicked}) {
  return Container(
    height: 100,
    color: AppConstants.themeColor.withOpacity(0.1),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 35,
              width: 35,
              color: AppConstants.themeColor,
              child: Center(
                child: const ThemeIconWidget(
                  ThemeIcon.backArrow,
                  size: 18,
                  color: Colors.white,
                ).lP8.ripple(() {
                  Get.back();
                }),
              ),
            ).circular,
            ThemeIconWidget(
              icon,
              size: 20,
              color: iconColor ?? AppConstants.iconColor,
            ).ripple(() {
              iconBtnClicked();
            }),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: BodyLargeText(title.tr, weight: TextWeight.medium),
          ),
        ),
      ],
    ).setPadding(
        left: AppConstants.horizontalPadding,
        right: AppConstants.horizontalPadding,
        top: 40),
  );
}

Widget profileScreensNavigationBar(
    {required String title,
    String? rightBtnTitle,
    required VoidCallback completion}) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeIconWidget(
            ThemeIcon.backArrow,
            size: 18,
            color: AppConstants.iconColor,
          ).ripple(() {
            Get.back();
          }),
          if (rightBtnTitle != null)
            BodyLargeText(rightBtnTitle.tr, weight: TextWeight.medium)
                .ripple(() {
              completion();
            }),
        ],
      ).setPadding(
          left: AppConstants.horizontalPadding,
          right: AppConstants.horizontalPadding),
      Positioned(
        left: 0,
        right: 0,
        child: Center(
          child: BodyLargeText(title.tr, weight: TextWeight.medium),
        ),
      )
    ],
  ).bP16;
}

Widget titleNavigationBarWithIcon(
    {required String title,
    required ThemeIcon icon,
    Color? iconColor,
    required VoidCallback completion}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(
        width: 25,
      ),
      BodyLargeText(title.tr, weight: TextWeight.medium),
      ThemeIconWidget(
        icon,
        color: iconColor ?? AppConstants.iconColor,
        size: 25,
      ).ripple(() {
        completion();
      }),
    ],
  ).setPadding(
      left: AppConstants.horizontalPadding,
      right: AppConstants.horizontalPadding,
      top: 8,
      bottom: 16);
}

Widget titleNavigationBar({required String title}) {
  return Container(
    height: 100,
    width: Get.width,
    color: AppConstants.themeColor.withOpacity(0.1),
    child: Center(
      child: BodyLargeText(title.tr, weight: TextWeight.medium)
          .setPadding(top: 40),
    ),
  );
}
