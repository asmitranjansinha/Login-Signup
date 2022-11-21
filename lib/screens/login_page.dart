// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:login_signup/widgets/input_field.dart';
import 'package:login_signup/widgets/reset_password.dart';
import 'package:lottie/lottie.dart';

import '../widgets/social_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const route = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  showLoading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Please wait")
                ],
              ),
            ),
          );
        });
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async {
    log("Signed In");
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    log("message");
    Get.to(() => const HomePage());
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.purple[200],
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF552586),
                    Color(0xFF6A359C),
                    Color(0xFF804FB3),
                    Color(0xFF9969C7),
                  ])),
              child: SafeArea(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, IntroPage.route, (route) => false);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white60,
                        ),
                      ),
                      Text(
                        'LOGIN !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                GoogleFonts.montserratAlternates().fontFamily),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      child: Lottie.asset(
                          "assets/images/113519-cyber-security.json")),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      InputField(
                        icon: Icons.mail_lock_outlined,
                        hintxt: 'Mail',
                        obscureText: false,
                        fieldcontroller: _emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        icon: Icons.lock_open_outlined,
                        hintxt: "Password",
                        obscureText: true,
                        fieldcontroller: _passwordController,
                      ),
                      const SizedBox(height: 22),
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ResetPassword();
                              });
                        },
                        child: Text(
                          "forgot password ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.lato().fontFamily),
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppButton(txt: "L O G I N", func: logIn),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "first time here ?",
                        style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, SignUp.route, (route) => false);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.lato().fontFamily),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("_________________________",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SocialButtons(img: "assets/images/google.png"),
                      SizedBox(
                        width: 30,
                      ),
                      SocialButtons(img: "assets/images/facebook.png"),
                      SizedBox(
                        width: 30,
                      ),
                      SocialButtons(img: "assets/images/twitter.png")
                    ],
                  )
                ],
              )),
            )),
      ),
    );
  }
}
