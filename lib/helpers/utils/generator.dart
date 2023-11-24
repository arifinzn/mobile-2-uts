import 'dart:math';
import 'package:flutter/material.dart';

class Generator {
  static const Color starColor = Color(0xfff9c700);
  static const Color goldColor = Color(0xffFFDF00);
  static const Color silverColor = Color(0xffC0C0C0);
  static const String _dummyText =
      "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum. Sudah merupakan fakta bahwa seorang pembaca akan terpengaruh oleh isi tulisan dari sebuah halaman saat ia melihat tata letaknya. Maksud penggunaan Lorem Ipsum adalah karena ia kurang lebih memiliki penyebaran huruf yang normal, ketimbang menggunakan kalimat seperti";

  static const String _emojiText =
      "😀 😃 😄 😁 😆 😅 😂 🤣 😍 🥰 😘 😠 😡 💩 👻 🧐 🤓 😎 😋 😛 😝 😜 😢 😭 😤 🥱 😴 😾";

  static String randomString(int length) {
    var rand = Random();
    var codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return String.fromCharCodes(codeUnits);
  }

  static String getDummyText(int words,
      {bool withTab = false, bool withEmoji = false, withStop = true}) {
    var rand = Random();
    List<String> dummyTexts = _dummyText.split(" ");

    if (withEmoji) {
      dummyTexts.addAll(_emojiText.split(" "));
    }

    int size = dummyTexts.length;
    String text = "";
    if (withTab) text += "\t\t\t\t";
    String firstWord = dummyTexts[rand.nextInt(size)];
    firstWord = firstWord[0].toUpperCase() + firstWord.substring(1);
    text += "$firstWord ";

    for (int i = 1; i < words; i++) {
      text += dummyTexts[rand.nextInt(size)] + (i == words - 1 ? "" : " ");
    }

    return text + (withStop ? "." : "");
  }

  static String getParagraphsText(
      {int paragraph = 1,
      int words = 20,
      int noOfNewLine = 1,
      bool withHyphen = false,
      bool withEmoji = false}) {
    String text = "";
    for (int i = 0; i < paragraph; i++) {
      if (withHyphen) {
        text += "\t\t-\t\t";
      } else {
        text += "\t\t\t\t";
      }
      text += getDummyText(words, withEmoji: withEmoji);
      if (i != paragraph - 1) {
        for (int j = 0; j < noOfNewLine; j++) {
          text += "\n";
        }
      }
    }
    return text;
  }

  static String getTextFromSeconds(
      {int time = 0,
      bool withZeros = true,
      bool withHours = true,
      bool withMinutes = true,
      bool withSpace = true}) {
    int hour = (time / 3600).floor();
    int minute = ((time - 3600 * hour) / 60).floor();
    int second = (time - 3600 * hour - 60 * minute);

    String timeText = "";

    if (withHours && hour != 0) {
      if (hour < 10 && withZeros) {
        timeText += "0$hour${withSpace ? " : " : ":"}";
      } else {
        timeText += hour.toString() + (withSpace ? " : " : "");
      }
    }

    if (withMinutes) {
      if (minute < 10 && withZeros) {
        timeText += "0$minute${withSpace ? " : " : ":"}";
      } else {
        timeText += minute.toString() + (withSpace ? " : " : "");
      }
    }

    if (second < 10 && withZeros) {
      timeText += "0$second";
    } else {
      timeText += second.toString();
    }

    return timeText;
  }

  static Widget buildOverlaysProfile(
      {double size = 50,
      required List<String> images,
      bool enabledOverlayBorder = false,
      Color overlayBorderColor = Colors.white,
      double overlayBorderThickness = 1,
      double leftFraction = 0.7,
      double topFraction = 0}) {
    double leftPlusSize = size * leftFraction;
    double topPlusSize = size * topFraction;
    double leftPosition = 0;
    double topPosition = 0;

    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      if (i == 0) {
        list.add(
          Container(
            decoration: enabledOverlayBorder
                ? BoxDecoration(
                    border: Border.all(
                        color: Colors.transparent,
                        width: overlayBorderThickness),
                    shape: BoxShape.circle)
                : BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              child: Image(
                image: AssetImage(images[i]),
                height: size,
                width: size,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      } else {
        leftPosition += leftPlusSize;
        topPosition += topPlusSize;
        list.add(Positioned(
          left: leftPosition,
          top: topPosition,
          child: Container(
            decoration: enabledOverlayBorder
                ? BoxDecoration(
                    border: Border.all(
                        color: overlayBorderColor,
                        width: overlayBorderThickness),
                    shape: BoxShape.circle)
                : BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              child: Image(
                image: AssetImage(images[i]),
                height: size,
                width: size,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
      }
    }
    double width =
        leftPosition + size + ((images.length) * overlayBorderThickness);
    double height =
        topPosition + size + ((images.length) * overlayBorderThickness);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(clipBehavior: Clip.none, children: list),
    );
  }
}
