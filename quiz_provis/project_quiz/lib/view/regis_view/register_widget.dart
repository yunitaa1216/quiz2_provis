// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_quiz/viewmodel/regis_viewmodel/register_api.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return 
    Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: 377,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widgetForm(),
                const SizedBox(height: 30),
                //---------------------- SIGN UP BUTTON ---------------------
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
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                        var viewModel = Provider.of<RegisterViewModel>(
                              context,
                              listen: false);
                        var response = await viewModel.registerUser( 
                          username: _nameController.text, 
                          password: _passwordController.text, 
                          );
                          if (response.statusCode == 200){
                            viewModel.register();
                            Navigator.pushNamed(context,'/new');
                          }
                          else {
                            print("Unexpected status code: ${response.statusCode}");
                          }
                        // print('Username: ${_nameController.text}');
                        // print('Phone: ${_phoneController.text}');
                        // print('Email: ${_emailController.text}');
                        // print('Password: ${_passwordController.text}');
                        // print('Birthdate: ${_birthdayController.text}');
                      }
                   catch (error) {
                          print("Error: $error");
                          if (error is DioError) {
                            print("DioError details: ${error.response?.data}");
                          }
                        }
                      }
                    },
                    child: const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Text(
                          'Daftar',
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
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetForm() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 260),
          const Text(
            'Buat Akun',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 18),
              //-------------Nama Lengkap--------------
              Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                      SizedBox(height: 4),
                       Container(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          hintText: "Masukkan nama lengkap anda",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Wajib diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
          const SizedBox(height: 12),
          //------------------------ PASSWORD ----------------------------
          Container(
            width: double.infinity,
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
                  width: double.infinity,
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        hintText: "Masukkan password anda",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          padding: const EdgeInsets.only(),
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password wajib diisi';
                        }
                        if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                          return 'Password harus mengandung huruf besar';
                        }
                        if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                          return 'Password harus mengandung huruf kecil';
                        }
                        if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                          return 'Password harus mengandung angka';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                    ),
                  ),
                ),
        ],
      ),
          )
        ]
      )
    );
    // ]));
  }
}