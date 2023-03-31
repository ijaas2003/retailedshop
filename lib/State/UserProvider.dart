import 'package:flutter/material.dart';
import 'package:retailedshop/Model/user.dart';
import 'package:retailedshop/auth.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final Auth _auth = Auth();
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}