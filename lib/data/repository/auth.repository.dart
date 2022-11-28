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

  update(data) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.update), body: data);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  register(body) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.register), body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  education(body) async {
    try {
      var response =
          await http.post(Uri.parse(AppUrls.educationForm), body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  lifeStyle(body) async {
    try {
      var response =
          await http.post(Uri.parse(AppUrls.lifeStyleForm), body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  profile(String id) async {
    try {
      var response = await http.get(Uri.parse("${AppUrls.profile}/$id"));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
