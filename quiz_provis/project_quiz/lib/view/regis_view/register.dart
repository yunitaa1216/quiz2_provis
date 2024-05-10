// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:flutter/material.dart';
import 'package:project_quiz/view/regis_view/register_widget.dart';
import 'package:project_quiz/view/regis_view/register_widget2.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_quiz.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RegisterWidget(),
                  SizedBox(height: 55),
                  AlreadyHaveAccount(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
