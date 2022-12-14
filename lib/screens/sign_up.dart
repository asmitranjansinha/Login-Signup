// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      setState(() {
        _controller.forward();
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      log("Signed Up");
      Get.offAll(HomePage(), transition: Transition.rightToLeftWithFade);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _controller.stop();
      });
      showSnackBar(context, e.message, Colors.black38);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              height: height,
              width: width,
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
                  SizedBox(
                    height: height / 50,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ArcaMajora3'),
                  ),
                  SizedBox(height: height / 30),
                  SizedBox(
                      height: height / 10,
                      child: Lottie.asset(
                          "assets/images/9308-welcome-screen-animation.json")),
                  SizedBox(
                    height: height / 30,
                  ),
                  Column(
                    children: [
                      InputField(
                          icon: "assets/icons/user.png",
                          hintxt: 'Name',
                          fieldcontroller: _nameController,
                          type: TextInputType.name),
                      SizedBox(
                        height: height / 35,
                      ),
                      InputField(
                          icon: "assets/icons/email.png",
                          hintxt: 'Mail',
                          fieldcontroller: _emailController,
                          type: TextInputType.emailAddress),
                      SizedBox(
                        height: height / 35,
                      ),
                      Inputfield4Password(
                          icon: "assets/icons/magnifying-glass.png",
                          hintxt: "Password",
                          fieldcontroller: _passwordController,
                          type: TextInputType.visiblePassword),
                      SizedBox(height: height / 25),
                      AppButton(txt: "S I G N  U P", func: signUp),
                    ],
                  ),
                  SizedBox(height: height / 22),
                  Container(
                    height: 20,
                    width: 210,
                    decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "not the first time here ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fox&Cat',
                              color: Colors.white70),
                        ),
                        SizedBox(width: width / 60),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(const LoginPage(),
                                transition: Transition.zoom);
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Fox&Cat'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 150,
                  ),
                  Lottie.asset("assets/images/81045-rocket-launch.json",
                      height: 200, controller: _controller)
                ],
              )),
            )),
      ),
    );
  }
}
