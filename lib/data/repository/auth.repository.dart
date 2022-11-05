import 'package:dio/dio.dart';
import 'package:app/utils/constants/app_urls_constant.dart';

class AuthRepository {
  var dio = Dio();

  login(String username, String password) async {
    try {
      Response response = await dio.post(AppUrls.login,
          data: FormData.fromMap({'username': username, 'password': password}));
      return response;
    } catch (e) {
      return e;
    }
  }
}
