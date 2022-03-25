import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  //set data into shared preferences like this
  Future<void> setPrefData(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

//get value from shared preferences
  Future<dynamic> getPrefData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? null;
  }

  Future<void> clearPref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
