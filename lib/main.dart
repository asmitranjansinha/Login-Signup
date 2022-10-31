import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/helper/helper_function.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/login_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() {
    HelperFunction.getUserLoggedInStatus().then((value) {
      log(value.toString());
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: GoogleFonts.openSans().fontFamily,
            primarySwatch: Colors.purple),
        debugShowCheckedModeBanner: false,
        home: _isSignedIn ? const HomePage() : const IntroPage(),
        routes: {
          IntroPage.route: (context) => const IntroPage(),
          LoginPage.route: (context) => const LoginPage(),
          SignUp.route: (context) => const SignUp(),
          HomePage.route: (context) => const HomePage(),
        });
  }
}
