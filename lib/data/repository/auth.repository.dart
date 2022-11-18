import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  var dio = Dio();

  login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.login),
          body: {'email': username, 'password': password});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  profile(int id) async {
    try {
      var response = await http.get(Uri.parse(AppUrls.profile));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
