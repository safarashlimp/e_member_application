import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getClientId() async {
  final prefs = await SharedPreferences.getInstance();
  final id = prefs.getString(PrefKeys.clientId);

  if (id == null) {
    throw Exception('Client ID not found');
  }
  return id;
}
