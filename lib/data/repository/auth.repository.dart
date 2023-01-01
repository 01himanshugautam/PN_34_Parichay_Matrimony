import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:flutter/rendering.dart';
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
      debugPrint(e.toString());
      return e;
    }
  }

  changePassword(String userId, String password) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.changePassword),
          body: {'user_id': userId, 'password': password});
      return response.body;
    } catch (e) {
      log(e.toString());
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

  otpSend(String id, String mobile) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.otpSend),
          body: {'user_id': id, 'mobile_no': mobile});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  uploadImages(String id, images) async {
    try {
      List<http.MultipartFile> newList = [];
      var request =
          http.MultipartRequest("POST", Uri.parse(AppUrls.imageUpload));
      for (var img in images) {
        var multipartFile = await http.MultipartFile.fromPath(
          'files[]',
          img.path,
          filename: img.path.split('/').last,
        );
        newList.add(multipartFile);
      }
      request.fields['user_id'] = id;
      request.files.addAll(newList);
      var response = await request.send();
      var data = await http.Response.fromStream(response);
      return jsonDecode(data.body);
    } catch (e) {
      return e;
    }
  }
}
