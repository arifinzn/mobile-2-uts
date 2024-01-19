import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kel7/helpers/utils/app_constant.dart';

class Repository {
  Future<bool> checkSession(String sessionToken) async {
    final Dio _dio = Dio();
    try {
//source check session di sini
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String sessionToken = prefs.getString('session') ?? "";
      Map fdataMap = {'session_token': sessionToken};
      FormData fdata = FormData();
      fdata.fields
          .addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
      final response = await _dio.post(
        '${AppConstants.baseUrl}/users/session',
        data: fdata,
      );
      log("check session $response");
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        return true;
      }
    } catch (error) {
// Handle error if needed
    }
    return false;
  }

  Future<Map<String, dynamic>> getData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String prefsRead = prefs.getString(key) ?? "";

    Map<String, dynamic>? result;

    if (prefsRead != null) {
      result = json.decode(prefsRead);
    } else {
      result = {};
    }

    return result!;
  }
}
