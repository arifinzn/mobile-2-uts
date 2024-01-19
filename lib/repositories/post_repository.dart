import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kel7/helpers/utils/app_constant.dart';
import 'package:kel7/models/post.dart';
import 'package:kel7/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kel7/repositories/repository.dart';

class PostRepository extends Repository {
  Repository? repo;

  Future<List<Post>> postList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sessionToken = prefs.getString('session') ?? "";

    List<Post> list = [];
    try {
      log('${AppConstants.baseUrl}/posts');
      final Dio _dio = Dio();

      final response = await _dio.get('${AppConstants.baseUrl}/posts');
      // log("res ${response.data}");

      if (response.statusCode == 200) {
        // final Map<String, dynamic> data = json.decode(response.data);
        final Map<String, dynamic> data = response.data;

        if (data['status'] == 'success') {
          log("data: ${data['data']}");
          // List<Map<String, dynamic>> dt = data['data'];
          data['data'].forEach((p) {
            list.add(Post.fromMap(p));
          });
        }
      }
    } catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      // if (e.response != null) {
      //   print(e.response!.data.toString());
      // } else {
      //   // Something happened in setting up or sending the request that triggered an Error
      //   print(e.requestOptions);
      print('err:' + e.toString());
      // }
    }
    return list;
  }

  Future addPost({required String desc, required XFile img}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sessionToken = prefs.getString('session') ?? "";

    Map repoResponse = {"status": false, "data": Null};
    try {
      log('${AppConstants.baseUrl}/posts/create');
      final Dio _dio = Dio();

      String fileName = img.path.split('/').last;
      FormData fdataMap = FormData.fromMap({
        'session_token': sessionToken,
        'desc': desc,
        "img": await MultipartFile.fromFile(img.path, filename: fileName),
      });
      final response = await _dio.post('${AppConstants.baseUrl}/posts/create',
          data: fdataMap);
      log("res ${response.data}");

      if (response.statusCode == 200) {
        // final Map<String, dynamic> data = json.decode(response.data);
        final Map<String, dynamic> data = response.data;
        if (data['status'] == 'success') {
          repoResponse['status'] = true;
          repoResponse['data'] = data['data'];
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
}
