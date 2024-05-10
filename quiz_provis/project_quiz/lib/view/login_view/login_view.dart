// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:flutter/material.dart';
import 'package:project_quiz/view/login_view/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.25),
              BlendMode.srcOver, // Sesuaikan mode blend yang diinginkan
            ),
            child: Image.asset(
              'assets/images/bg_quiz.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 262,
                  ),
                  LoginWidget(),
                  SizedBox(height: 135),
                  DonTHaveAnAccountSignUp(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
