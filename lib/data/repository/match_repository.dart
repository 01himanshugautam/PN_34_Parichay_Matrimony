import 'dart:convert';
import 'dart:developer';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:http/http.dart' as http;

class MatchRepository {
  userMatches(String userId) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrls.userMatches), body: {'user_id': userId});
      log(response.body.toString() + userId);
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userInterested(String userId) async {
    try {
      var response =
          await http.get(Uri.parse('${AppUrls.userInterest}/$userId'));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userInterestedReceived(String userId, int page) async {
    try {
      var response =
          await http.get(Uri.parse('${AppUrls.userInterestReceived}/$userId'));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userInterestedSent(String userId, int page) async {
    Uri uri = Uri.parse('${AppUrls.userInterestSent}/$userId');
    log("Url $uri");
    try {
      var response = await http.get(uri);
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userViewedContactMe(String userId, int page) async {
    Uri uri = Uri.parse('${AppUrls.userViewMyContact}/$userId');
    log("Url $uri");
    try {
      var response = await http.get(uri);
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userViewedContact(String userId, int page) async {
    Uri uri = Uri.parse('${AppUrls.userViewContact}/$userId');
    log("Url $uri");
    try {
      var response = await http.get(uri);
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userAccepted(String userId, int page) async {
    Uri uri = Uri.parse('${AppUrls.userAccepted}/$userId');
    log("Url $uri");
    try {
      var response = await http.get(uri);
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userAcceptedMy(String userId, int page) async {
    Uri uri = Uri.parse('${AppUrls.userAcceptanceMy}/$userId');
    log("Url $uri");
    try {
      var response = await http.get(uri);
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userShortlisted(String userId) async {
    String url = '${AppUrls.userShortList}/$userId';
    log("Url $url ");
    try {
      var response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  userShortlistedMe(String userId) async {
    Uri uri = Uri.parse('${AppUrls.userShortListMe}/$userId');
    log("Url $uri");
    try {
      var response = await http.get(uri);
      log("Response  ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
