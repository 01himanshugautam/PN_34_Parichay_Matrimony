import 'dart:convert';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  getUserImages(userId) async {
    try {
      var response =
          await http.post(Uri.parse(AppUrls.images), body: {'user_id': userId});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  deleteImage(imageId) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrls.deleteImage), body: {'id': imageId});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  setProfileImage(userId, imageId) async {
    try {
      var response = await http.post(Uri.parse(AppUrls.setProfileImage),
          body: {'user_id': userId, 'id': imageId});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
