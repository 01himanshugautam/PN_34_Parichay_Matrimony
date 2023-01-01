import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  var dio = Dio();

  country() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.country));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  state(String id) async {
    try {
      var response =
          await http.post(Uri.parse(AppUrls.state), body: {'country_id': id});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  city(String id) async {
    try {
      var response =
          await http.post(Uri.parse(AppUrls.city), body: {'state_id': id});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  caste() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.caste));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  education() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.education));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  occupations() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.occupation));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  income() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.income));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  religion() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.religion));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  height() async {
    try {
      // var response = await http.get(Uri.parse(AppUrls.height));
      String data = await rootBundle.loadString('assets/json/height.json');
      return json.decode(data);
      // return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  languages() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.languages));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  filter(data) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.filter), body: data);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  filterById(String id) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrls.filterById), body: {'profileid': id});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  occupation() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.occupation));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
