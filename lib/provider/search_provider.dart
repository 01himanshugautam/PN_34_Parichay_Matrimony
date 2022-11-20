import 'package:app/data/models/user.model.dart';
import 'package:app/data/repository/search_repository.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  SearchProvider();
  var searchRepository = SearchRepository();

  Users? user;

  get getUser {
    return user;
  }

  country() async {
    var response = await searchRepository.country();
    notifyListeners();
    return response;
  }

  state(String id) async {
    var response = await searchRepository.state(id);
    notifyListeners();
    return response;
  }

  city(String id) async {
    var response = await searchRepository.city(id);
    notifyListeners();
    return response;
  }

  caste() async {
    var response = await searchRepository.caste();
    notifyListeners();
    return response;
  }

  education() async {
    var response = await searchRepository.education();
    notifyListeners();
    return response;
  }

  occupations() async {
    var response = await searchRepository.occupations();
    notifyListeners();
    return response;
  }

  income() async {
    var response = await searchRepository.income();
    notifyListeners();
    return response;
  }

  religion() async {
    var response = await searchRepository.religion();
    notifyListeners();
    return response;
  }

  height() async {
    var response = await searchRepository.height();
    notifyListeners();
    return response;
  }

  languages() async {
    var response = await searchRepository.languages();
    notifyListeners();
    return response;
  }

  filter() async {
    var response = await searchRepository.filter();
    notifyListeners();
    return response;
  }

  filterById() async {
    var response = await searchRepository.filterById();
    notifyListeners();
    return response;
  }
}
