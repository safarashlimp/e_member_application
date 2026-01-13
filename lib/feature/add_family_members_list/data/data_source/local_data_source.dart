import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<int> getClientId();
  Future<int> getUserId();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<int> getClientId() async {
    return sharedPreferences.getInt('clientId') ?? 0;
  }

  @override
  Future<int> getUserId() async {
    return sharedPreferences.getInt('userId') ?? 0;
  }
}
