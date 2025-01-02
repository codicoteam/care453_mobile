import 'package:care453/models/user-profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserProfileProvider extends ChangeNotifier {
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  void setUserProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  void _clearUserProfile() {
    _userProfile = null;
    notifyListeners();
  }

  // Future<void> clearUserProfileData() async {
  //   await SharedPreferencesHelper.clearUserProfileFromCache();
  //   _clearUserProfile();
  // }
}
