import 'dart:convert';
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
}
