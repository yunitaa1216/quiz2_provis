// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:flutter/material.dart';
import 'package:project_quiz/model/login_model/login_model.dart';
import 'package:project_quiz/model/utils/auth_service.dart';
import 'package:project_quiz/view/regis_view/register.dart';
import 'package:project_quiz/viewmodel/login_viewmodel/login_api.dart';

class DonTHaveAnAccountSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Belum punya akun?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ),
              );
            },
            child: const Text(
              'Daftar',
              style: TextStyle(
                color: Color.fromARGB(255, 75, 164, 79),
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ))
      ],
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Menentukan apakah password terlihat atau tidak
  String _massageError = '';

  final LoginViewModel _loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 377,
          height: 370,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 6),
                    const Text(
                      'Masukkan Username dan Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 68,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 250,
                                  height: 28,
                                  child: TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Masukkan username",
                                      hintStyle: TextStyle(
                                          color: Colors.black, // Warna teks hint
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black, // Warna teks input
                                      fontFamily: 'Raleway',
                                      // Ganti dengan font family yang diinginkan
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    if (_massageError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Email $_massageError',
                          style: const TextStyle(
                            color: Color(0xFF3C96E9),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Container(
                      // width: double.infinity,
                      height: 73,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 345,
                                  height: 33,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Masukkan Password",
                                      hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(
                                            top: 2, bottom: 2, left: 18),
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                          // size: 25,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_massageError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Password $_massageError',
                          style: const TextStyle(
                            color: Color(0xFF3C96E9),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Center(child:
              Container(
                width: 150,
                height: 48,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 75, 164, 79),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                        String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Inl1bml0YWEiLCJleHAiOjE3MTU0MTIxOTh9.oaFptdmyHUsetrvazYEmklOsema7sAgXMQdfnat13uc';
                        Navigator.pushReplacementNamed(context, "/new");
                        AuthService.token = token;
                  },
                //  child: InkWell(
                //   onTap: () {
                //     //ambil data dari Controller
                //     String username = _nameController.text;
                //     String password = _passwordController.text;

                //     // Buat objek LoginData dari input pengguna
                //     LoginData loginData =
                //         LoginData(username: username, password: password);
                //     _loginViewModel.loginUser(loginData, AuthService.token).then((loginResponse) {
                //       if (loginResponse.sucess == true) {
                //         print('ke halaman on boarding');
                //         AuthService.token = loginResponse.token;
                //         // AuthService.role = loginResponse.role;

                //         Navigator.pushReplacementNamed(context, "/new");
                //       } else {
                //         // Tampilkan pesan kesalahan jika login gagal
                //         setState(() {
                //           _massageError = 'salah';
                //         });
                //       }
                //     });
                //   },
                child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Text(
                        'Masuk',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
              )
              )
              )
            ],
          ),
        ),
      ],
    );
  }
}