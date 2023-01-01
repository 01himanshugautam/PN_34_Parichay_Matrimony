import 'package:app/data/repository/match_repository.dart';
import 'package:flutter/material.dart';

class MatchProvider with ChangeNotifier {
  MatchProvider();
  var machRepository = MatchRepository();

  userMatches(String userId) async {
    var response = await machRepository.userMatches(userId);
    notifyListeners();
    return response;
  }

  userInterestedReceived(String userId, int page) async {
    var response = await machRepository.userInterestedReceived(userId, page);
    notifyListeners();
    return response;
  }

  userInterestedSent(String userId, int page) async {
    var response = await machRepository.userInterestedSent(userId, page);
    notifyListeners();
    return response;
  }

  userViewedContactMe(String userId, int page) async {
    var response = await machRepository.userViewedContactMe(userId, page);
    notifyListeners();
    return response;
  }

  userViewedContact(String userId, int page) async {
    var response = await machRepository.userViewedContact(userId, page);
    notifyListeners();
    return response;
  }

  userAccepted(String userId, int page) async {
    var response = await machRepository.userAccepted(userId, page);
    notifyListeners();
    return response;
  }

  userAcceptedMy(String userId, int page) async {
    var response = await machRepository.userAcceptedMy(userId, page);
    notifyListeners();
    return response;
  }

  userShortlisted(String userId, int page) async {
    var response = await machRepository.userShortlisted(userId);
    notifyListeners();
    return response;
  }

  userShortlistedMe(String userId, int page) async {
    var response = await machRepository.userShortlistedMe(userId);
    notifyListeners();
    return response;
  }
}
