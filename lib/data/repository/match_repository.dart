import 'dart:convert';
import 'dart:developer';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:http/http.dart' as http;

class MatchRepository {
  userMatches(String userId) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrls.userMatches), body: {'user_id': userId});
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

  userShortlisted(String userId) async {
    String url = '${AppUrls.userShortlist}/$userId';
    log("Url $url ");
    try {
      var response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
