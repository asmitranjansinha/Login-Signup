import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/login_page.dart';
import 'package:login_signup/screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),

      routes: {
        IntroPage.route:(context) => const IntroPage(),
        LoginPage.route:(context) => const LoginPage(),
        SignUp.route:(context) => const SignUp(),
        HomePage.route:(context) => const HomePage(),

      }
    );
  }
}
