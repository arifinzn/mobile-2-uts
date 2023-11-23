import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:lottie/lottie.dart';

class TopPointingTriangle extends CustomPainter {
  Paint painter = Paint();
  Color color;

  TopPointingTriangle({required this.color}) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LeftPointingTriangle extends CustomPainter {
  Paint painter = Paint();
  Color color;

  LeftPointingTriangle({required this.color}) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width / 2.5, size.height / 2);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RightPointingTriangle extends CustomPainter {
  Paint painter = Paint();
  Color color;

  RightPointingTriangle({required this.color}) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width / 1.5, size.height / 2);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Widget divider({double? height, Color? color}) {
  return Container(
    height: height ?? 0.1,
    color: color ?? AppConstants.dividerColor,
  );
}

Widget noUserFound(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Lottie.asset(
        'assets/lottie/no_record.json',
        height: 200,
        // width: 200,
      ),
      const SizedBox(
        height: 20,
      ),
      Heading5Text(
        noUserFoundString.tr,
        weight: TextWeight.medium,
      )
    ],
  );
}

Widget emptyPost({
  required String title,
  required String subTitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.asset(
        'assets/lottie/no_record.json',
        height: 200,
        // width: 200,
      ),
      const SizedBox(
        height: 20,
      ),
      Heading6Text(
        title,
        weight: TextWeight.medium,
      ),
      const SizedBox(
        height: 10,
      ),
      BodyLargeText(
        subTitle,
      ),
    ],
  );
}

Widget emptyUser({
  required String title,
  required String subTitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.asset(
        'assets/lottie/no_record.json',
        height: 200,
        // width: 200,
      ),
      const SizedBox(
        height: 20,
      ),
      Heading6Text(title, weight: TextWeight.medium),
      const SizedBox(
        height: 10,
      ),
      BodyLargeText(
        subTitle,
      ),
    ],
  );
}

Widget emptyData({required String title, required String subTitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.asset(
        'assets/lottie/no_record.json',
        height: 200,
        // width: 200,
      ),
      const SizedBox(
        height: 20,
      ),
      Heading6Text(title, weight: TextWeight.medium),
      const SizedBox(
        height: 10,
      ),
      BodyLargeText(
        subTitle,
      ),
    ],
  );
}
