// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _isRegistered = false;

  bool get isRegistered => _isRegistered;

  void register() {
    _isRegistered = true;
    notifyListeners();
  }

  Future<Response> registerUser({
    required String username,
    required String password,
  }) async {
    try {
      Response response = await Dio().post(
        'http://146.190.109.66:8000/users/',
        data: {
          "username": username,
          "password": password,
        },
      );
      return response;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Failed to register user: $error");
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RegisterViewModel {
//   Future<void> registerUser({
//     required String fullName,
//     required String phoneNumber,
//     required String birthDate,
//     required String email,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     try {
//       Map<String, String> data = {
//         'username': fullName,
//         'no_hp': phoneNumber,
//         'tanggal_lahir': birthDate,
//         'email': email,
//         'kata_sandi': password,
//         'konfirmasi_kata_sandi': confirmPassword,
//       };

//       final response = await http.post(
//         Uri.parse('http://localhost:8000/register'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(data),
//       );

//       // Handle response accordingly
//       print(response.body);
//     } catch (e) {
//       // Handle error accordingly
//       print('Error: $e');
//     }
//   }
// }

// void main() {
//   RegisterViewModel registerViewModel = RegisterViewModel();

//   String fullName = 'Yunita Anggeraini';
//   String phoneNumber = '082345678910';
//   String birthDate = '2003-06-16';
//   String email = 'yunn@gmail.com';
//   String password = 'Yun123';
//   String confirmPassword = 'Yun123';

//   registerViewModel.registerUser(
//     fullName: fullName,
//     phoneNumber: phoneNumber,
//     birthDate: birthDate,
//     email: email,
//     password: password,
//     confirmPassword: confirmPassword,
//   );
// }