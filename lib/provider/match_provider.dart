import 'package:app/data/models/user.model.dart';
import 'package:app/data/repository/match_repository.dart';
import 'package:flutter/material.dart';

class MatchProvider with ChangeNotifier {
  MatchProvider();
  var machRepository = MatchRepository();

  Users? user;

  get getUser {
    return user;
  }

  userMatches(String userId) async {
    var response = await machRepository.userMatches(userId);
    notifyListeners();
    return response;
  }
}
