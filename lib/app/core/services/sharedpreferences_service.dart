class SharedPreferencesService {

  Future<bool> saveLoggedUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
  }

  Future<bool> getLoggedUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.getInt('userId');
  }

  Future<bool> logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

}