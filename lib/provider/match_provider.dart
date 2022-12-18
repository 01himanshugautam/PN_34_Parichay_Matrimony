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

  userInterested(String userId) async {
    var response = await machRepository.userInterested(userId);
    notifyListeners();
    return response;
  }

  userShortlisted(String userId) async {
    var response = await machRepository.userShortlisted(userId);
    notifyListeners();
    return response;
  }
}
