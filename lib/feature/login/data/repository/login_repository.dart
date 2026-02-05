import 'package:e_member_app/core/apiKeys/apieys.dart';
import 'package:e_member_app/feature/login/data/model/usermodel.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<UserModel> login(String email, String password) async {
    final Uri uri = Uri.parse(Apieys.loginApi);

    final response = await http.post(
      uri,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.body.isEmpty) {
      throw Exception("Empty response from server");
    }

    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}
