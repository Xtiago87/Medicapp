import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<bool> saveLoggedUserId(int userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userId', userId);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<int> getLoggedUserId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('userId');
      if (userId == null) {
        return -1;
      }
      return userId;
    } catch (e) {
      debugPrint(e.toString());
      return -1;
    }
  }

  Future<bool> logoutUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userLoggedout = await prefs.remove('userId');
      return userLoggedout;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
