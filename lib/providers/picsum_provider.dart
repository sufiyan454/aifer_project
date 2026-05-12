import 'dart:convert';

import 'package:aifer_project/model/picsum_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskProvider extends ChangeNotifier {
  List<Pics> pics = [];

  void getAllUsers() async {
    http.Response res =
        await http.get(Uri.parse("https://picsum.photos/v2/list"));

    var details = jsonDecode(res.body);

    pics.clear();

    for (var i in details) {
      pics.add(Pics.fromJson(i));
    }

    notifyListeners();
  }

  void deleteUser(String id) async {
    pics.removeWhere((element) => element.id == id);

    notifyListeners();
  }
}