import 'dart:convert';
import 'dart:developer';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  getUserImages(userId) async {
    try {
      var response = await http
          .post(convertUri(AppUrls.images), body: {'user_id': userId});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  deleteImage(imageId) async {
    try {
      var response = await http
          .post(convertUri(AppUrls.deleteImage), body: {'id': imageId});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  setProfileImage(userId, imageId) async {
    try {
      var response = await http.post(convertUri(AppUrls.setProfileImage),
          body: {'user_id': userId, 'id': imageId});
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userMatches(String userId) async {
    try {
      var response = await http
          .post(convertUri(AppUrls.userMatches), body: {'user_id': userId});
      log(response.body.toString() + userId);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userInterested(String userId) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userInterest}/$userId'));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userInterestedReceived(String userId, int page) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userInterestReceived}/$userId'));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userInterestedSent(String userId, int page) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userInterestSent}/$userId'));
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userViewedContactMe(String userId, int page) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userViewMyContact}/$userId'));
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userViewedContact(String userId, int page) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userViewContact}/$userId'));
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userAccepted(String userId, int page) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userAccepted}/$userId'));
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userAcceptedMy(String userId, int page) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userAcceptanceMy}/$userId'));
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userShortlisted(String userId) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userShortList}/$userId'));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userShortlistedMe(String userId) async {
    try {
      var response =
          await http.get(convertUri('${AppUrls.userShortListMe}/$userId'));
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  successStory() async {
    try {
      var response = await http.get(convertUri(AppUrls.successStories));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
