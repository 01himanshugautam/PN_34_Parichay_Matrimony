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
    try {
      var response = userRepository.setProfileImage(userId, imageId);
      notifyListeners();
      return response;
    } catch (e) {
      return e;
    }
  }

  userMatches(String userId) async {
    var response = await userRepository.userMatches(userId);
    notifyListeners();
    return response;
  }

  userInterestedReceived(String userId, int page) async {
    var response = await userRepository.userInterestedReceived(userId, page);
    notifyListeners();
    return response;
  }

  userInterestedSent(String userId, int page) async {
    var response = await userRepository.userInterestedSent(userId, page);
    notifyListeners();
    return response;
  }

  userViewedContactMe(String userId, int page) async {
    var response = await userRepository.userViewedContactMe(userId, page);
    notifyListeners();
    return response;
  }

  userViewedContact(String userId, int page) async {
    var response = await userRepository.userViewedContact(userId, page);
    notifyListeners();
    return response;
  }

  userAccepted(String userId, int page) async {
    var response = await userRepository.userAccepted(userId, page);
    notifyListeners();
    return response;
  }

  userAcceptedMy(String userId, int page) async {
    var response = await userRepository.userAcceptedMy(userId, page);
    notifyListeners();
    return response;
  }

  userShortlisted(String userId, int page) async {
    var response = await userRepository.userShortlisted(userId);
    notifyListeners();
    return response;
  }

  userShortlistedMe(String userId, int page) async {
    var response = await userRepository.userShortlistedMe(userId);
    notifyListeners();
    return response;
  }

  successStory() async {
    var response = await userRepository.successStory();
    notifyListeners();
    return response;
  }
}
