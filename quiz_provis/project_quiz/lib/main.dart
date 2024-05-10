// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:flutter/material.dart';
import 'package:project_quiz/view/homepage/home.dart';
import 'package:project_quiz/view/login_view/login_view.dart';
import 'package:project_quiz/view/regis_view/register.dart';
import 'package:project_quiz/viewmodel/regis_viewmodel/register_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        // ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
    child:
     MaterialApp(
      debugShowCheckedModeBanner: false,
      // automaticallyImplyLeading: false,
      initialRoute: '/register',
      routes: {
        '/login': (context) => LoginView(), 
        '/register':(context) => Register(),
        '/new':(context) => Home()
      }
    ),   
    );
  }
}
