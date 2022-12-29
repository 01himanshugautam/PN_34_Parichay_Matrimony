import 'dart:developer';

import 'package:app/data/models/user.model.dart';
import 'package:app/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserProvider();
  var userRepository = UserRepository();

  Users? user;

  get getUser {
    return user;
  }

  userImages(String userId) async {
    var response = await userRepository.getUserImages(userId);
    notifyListeners();
    return response;
  }

  deleteImage(imageId) async {
    try {
      var response = await userRepository.deleteImage(imageId);
      notifyListeners();
      return response;
    } catch (e) {
      return e;
    }
  }

  setProfileImage(userId, imageId) async {
    log("Ids $userId and $imageId ");
    try {
      var response = userRepository.setProfileImage(userId, imageId);
      notifyListeners();
      return response;
    } catch (e) {
      return e;
    }
  }
}
