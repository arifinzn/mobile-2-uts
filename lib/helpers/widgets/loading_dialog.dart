import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kel7/models/loading.dart';

class LoadingDialog {
  static LoadingDialog? _singleton;

  factory LoadingDialog() {
    _singleton ??= LoadingDialog._internal();

    return _singleton!;
  }

  LoadingDialog._internal();

  static show(BuildContext context, Loading item, {VoidCallback? onDone}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      builder: (_) {
        return Material(
          color: Colors.white,
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 500,
              child: Column(
                children: [
                  Image.asset(
                    item.status == LoadingStatus.success
                        ? 'assets/loading_finish.gif'
                        : item.status == LoadingStatus.failed
                            ? 'assets/failed.gif'
                            : 'assets/loading.gif',
                    height: 160,
                    width: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      item.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return Future.delayed(const Duration(seconds: 2), onDone);
  }
}
