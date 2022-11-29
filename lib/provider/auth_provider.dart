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

  update(data) async {
    var response = await authRepository.update(data);
    notifyListeners();
    return response;
  }

  register(data) async {
    var response = await authRepository.register(data);
    notifyListeners();
    return response;
  }

  education(data) async {
    var response = await authRepository.education(data);
    notifyListeners();
    return response;
  }

  lifeStyle(data) async {
    var response = await authRepository.lifeStyle(data);
    notifyListeners();
    return response;
  }

  profile(String id) async {
    var response = await authRepository.profile(id);
    notifyListeners();
    // user = response.data;
    return response;
  }

  otpSend(String id, String mobile) async {
    var response = await authRepository.otpSend(id, mobile);
    notifyListeners();
    // user = response.data;
    return response;
  }

  imageUpload(String id, images) async {
    var response = await authRepository.uploadImages(id, images);
    notifyListeners();
    // user = response.data;
    return response;
  }
}
