import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:kel7/helpers/utils/app_constant.dart';
import 'package:kel7/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kel7/repositories/repository.dart';

class UserRepository extends Repository {
  Repository? repo;
  User? currentUser;

  Future<User?> getUserInfo() async {
    // Map<String, dynamic>? data = await repo?.getData(key: 'user');

    // if (data != null) {
    //   currentUser = User.fromMap(data);
    // }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String prefsRead = prefs.getString('user') ?? "";

    Map<String, dynamic>? result;

    if (prefsRead != null) {
      result = json.decode(prefsRead);
    } else {
      result = {};
    }

    return User.fromMap(result!);

    return currentUser;
  }

  Future login({required String email, required String password}) async {
    Map repoResponse = {"status": false, "data": Null};
    try {
      log('${AppConstants.baseUrl}/users/login');
      final Dio _dio = Dio();
      Map fdataMap = {'email': email, 'pwd': password};
      FormData fdata = FormData();
      fdata.fields
          .addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
      final response = await _dio.post(
        '${AppConstants.baseUrl}/users/login',
        data: fdata,
      );
      log("res ${response.data}");

      if (response.statusCode == 200) {
        // final Map<String, dynamic> data = json.decode(response.data);
        final Map<String, dynamic> data = response.data;
        if (data['status'] == 'success') {
          repoResponse['status'] = true;
          repoResponse['data'] = data['data'];
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('session', data['data']['session_token']);
          prefs.setString('user', jsonEncode(data['data']['user']));
        } else {
          repoResponse['data'] = data;
        }
      } else {
        repoResponse['status'] = false;
      }
    } catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      // if (e.response != null) {
      //   print(e.response!.data.toString());
      // } else {
      //   // Something happened in setting up or sending the request that triggered an Error
      //   print(e.requestOptions);
      //   print(e.message);
      // }
      print(e);
      repoResponse['status'] = false;
    }
    return repoResponse;
  }

  Future register(
      {required String npm,
      required String name,
      required String email,
      required String phone,
      required String password}) async {
    Map repoResponse = {"status": false, "data": Null};
    try {
      log('${AppConstants.baseUrl}/users/register');
      final Dio _dio = Dio();
      Map fdataMap = {
        'npm': npm,
        'name': name,
        'email': email,
        'phone': phone,
        'pwd': password
      };
      FormData fdata = FormData();
      fdata.fields
          .addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
      final response = await _dio.post(
        '${AppConstants.baseUrl}/users/register',
        data: fdata,
      );
      log("res ${response.data}");

      if (response.statusCode == 200) {
        // final Map<String, dynamic> data = json.decode(response.data);
        final Map<String, dynamic> data = response.data;
        if (data['status'] == 'success') {
          repoResponse['status'] = true;
          repoResponse['data'] = data['data'];
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('session', data['data']['session_token']);
          prefs.setString('user', jsonEncode(data['data']['user']));
        } else {
          repoResponse['data'] = data;
        }
      } else {
        repoResponse['status'] = false;
      }
    } catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      // if (e.response != null) {
      //   print(e.response!.data.toString());
      // } else {
      //   // Something happened in setting up or sending the request that triggered an Error
      //   print(e.requestOptions);
      //   print(e.message);
      // }
      print(e);
      repoResponse['status'] = false;
    }
    return repoResponse;
  }

  Future logout() async {
    // Map repoResponse = {"status": false, "data": Null};
    final Dio _dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sessionToken = prefs.getString('session') ?? "";
    Map fdataMap = {'session_token': sessionToken};

    FormData fdata = FormData();
    fdata.fields.addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
    final response = await _dio.post(
      '${AppConstants.baseUrl}/users/logout',
      data: fdata,
    );
    prefs.remove('session_token');
    prefs.remove('user');

    // repoResponse['status'] = true;
    // return repoResponse;
  }
}
