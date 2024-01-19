import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);
  // final _file = Image.memory(await _file1!.readAsBytes());
  return _file;
  // if (_file != null) {
  //   return await _file.readAsBytes();
  // } else {
  //   return null;
  // }
}
