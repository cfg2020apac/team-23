import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String name;
  final int points;
  final String contact;
  // final Wishes wishes;

  User({this.name, this.points, this.contact});
}

class Users with ChangeNotifier {
  var _user = User(name: 'John Doe', points: 210, contact: '9876543210');

  User get user {
    return _user;
  }

  void changePoints(int num) {
    final newPoints = _user.points + num;
    _user = User(name: _user.name, points: newPoints, contact: _user.contact);
  }
}