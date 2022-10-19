import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/login_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/utils/routes.dart';

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
        AppRoutes.introRoute:(context) => const IntroPage(),
        AppRoutes.loginRoute:(context) => const LoginPage(),
        AppRoutes.signupRoute:(context) => const SignUp(),
      }
    );
  }
}
