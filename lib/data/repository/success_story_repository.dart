import 'dart:convert';
import 'package:app/utils/constants/app_urls_constant.dart';
import 'package:http/http.dart' as http;

class SuccessRepository {
  successStory() async {
    try {
      var response = await http.get(Uri.parse(AppUrls.successStories));
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
