import 'package:e_member_app/core/apiKeys/apieys.dart';
import 'package:e_member_app/feature/login/data/model/usermodel.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<UserModel> login(String email, String password) async {
    // Build URL dynamically
    final String url = "${Apieys.loginApi}$email&password=$password";
    final Uri uri = Uri.parse(url);
    print(uri);

    // Send POST request
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print(response);
      return userModelFromJson(response.body);


    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}
