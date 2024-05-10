// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:http/http.dart' as http;
import 'package:project_quiz/model/login_model/login_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  Future<LoginResponse> loginUser(LoginData loginData, String token) async {
    print(loginData.username);
    print(loginData.password);
    String username = loginData.username;
    String password = loginData.password;
    // String token = '';
    // token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJzb3NvQGdtYWlsLmNvbSIsImlhdCI6MTcxMzc5OTc1Nn0.cqsYnhTquP1-9aul9LI-mId2doMeY03ZG0twA6DghSI';

      Map<String, String> data = {
        'username': username,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('http://146.190.109.66:8000/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token', // Gunakan token di sini
        },
        body: jsonEncode(data),
      );
      
      print(response.body);

      if (response.statusCode == 200) {
  // Memproses respons jika status code adalah 200
  final responseData = json.decode(response.body);

  if (responseData['code'] == 200 &&
      responseData['message'] == 'Authentication Success') {
    // Login berhasil
    String username = responseData['data']['username'];
    String password = responseData['data']['password'];
    String token = responseData['data']['token'];

    await saveToSharedPreferences(username, token, password);

    return LoginResponse(sucess: true, token: token);
  } else {
    // Jika respons tidak menunjukkan keberhasilan otentikasi
    print('salah username dan password');
    return LoginResponse(sucess: false, token: "",);
  }
} else {
  // Penanganan jika respons tidak berhasil dengan status code yang bukan 200
  print(
      'Response Status code bukan 200: tapi bernilai ${response.statusCode}');
  return LoginResponse(sucess: false, token: "",);
}
    }
  }

  Future<void> saveToSharedPreferences(
    String username,
    String token,
    String password,

  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', username);
    await prefs.setString('token', token);
  }

class LoginResponse {
  final bool sucess;
  final String token;

  LoginResponse({
    required this.sucess,
    required this.token,
  });
}
