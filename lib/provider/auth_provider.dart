import 'package:app/data/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:app/data/repository/auth.repository.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider();
  var authRepository = AuthRepository();

  Users? user;

  get getUser {
    return user;
  }

  login(String username, String password) async {
    var response = await authRepository.login(username, password);
    notifyListeners();
    return response;
  }

  register(data) async {
    var response = await authRepository.register(data);
    notifyListeners();
    return response;
  }

  profile(String id) async {
    var response = await authRepository.profile(id);
    notifyListeners();
    // user = response.data;
    return response;
  }
}
