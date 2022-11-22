// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/widgets/snack_bar.dart';
import 'package:lottie/lottie.dart';
import '../widgets/app_buttons.dart';
import '../widgets/input_field.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      log("Signed Up");
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message, Colors.black38);
    }
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
                  Text(
                    'Sign Up Now !',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            GoogleFonts.montserratAlternates().fontFamily),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                      height: 80,
                      child: Lottie.asset(
                          "assets/images/9308-welcome-screen-animation.json")),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      InputField(
                        icon: Icons.perm_identity,
                        hintxt: 'Name',
                        obscureText: false,
                        fieldcontroller: _nameController,
                        type: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        icon: Icons.mail_lock_outlined,
                        hintxt: 'Mail',
                        obscureText: false,
                        fieldcontroller: _emailController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        icon: Icons.lock_open_outlined,
                        hintxt: "Password",
                        obscureText: true,
                        fieldcontroller: _passwordController,
                        type: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 40),
                      AppButton(txt: "S I G N  U P", func: signUp),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "not the first time here ?",
                        style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const LoginPage());
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.lato().fontFamily),
                        ),
                      )
                    ],
                  )
                ],
              )),
            )),
      ),
    );
  }
}
