import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage
{
  static const _PREF_KEY_ACCESS_TOKEN = "pref_key_access_token";

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_PREF_KEY_ACCESS_TOKEN);
    return accessToken;
  }

  static Future<void> setAccessToken(String? accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    if(accessToken == null) {
      await prefs.remove(_PREF_KEY_ACCESS_TOKEN);
    }
    else {
      prefs.setString(_PREF_KEY_ACCESS_TOKEN, accessToken);
    }
  }
}
