import 'package:app/data/repository/success_story_repository.dart';
import 'package:flutter/material.dart';

class SuccessProvider with ChangeNotifier {
  SuccessProvider();
  var successRepository = SuccessRepository();

  successStory() async {
    var response = await successRepository.successStory();
    notifyListeners();
    return response;
  }
}
