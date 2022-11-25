// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:login_signup/widgets/input_field.dart';
import 'package:login_signup/widgets/reset_password.dart';
import 'package:login_signup/widgets/snack_bar.dart';
import 'package:lottie/lottie.dart';

import '../widgets/social_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
  }

  Future logIn() async {
    try {
      setState(() {
        _controller.forward();
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      log("message");
      Get.offAll(HomePage(), transition: Transition.rightToLeftWithFade);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message, Colors.black38);
      setState(() {
        _controller.stop();
      });
      log(e.message.toString());
      rethrow;
    }
  }

  Future loginGoogle() async {
    try {
      setState(() {
        _controller.forward();
      });
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      print(FirebaseAuth.instance.signInWithCredential(credential));
      Get.offAll(HomePage(), transition: Transition.rightToLeftWithFade);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message, Colors.black38);
      setState(() {
        _controller.stop();
      });
      log(e.message.toString());
      rethrow;
    }
  }

  Future loginFB() async {
    try {
      setState(() {
        _controller.forward();
      });
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      print(FirebaseAuth.instance.signInWithCredential(facebookAuthCredential));
      Get.offAll(HomePage(), transition: Transition.rightToLeftWithFade);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message, Colors.black38);
      setState(() {
        _controller.stop();
      });
      log(e.message.toString());
      rethrow;
    }
  }

  Future loginTwitter() async {
    try {
      TwitterAuthProvider twitterProvider = TwitterAuthProvider();
      if (kIsWeb) {
        await FirebaseAuth.instance.signInWithPopup(twitterProvider);
        Get.offAll(HomePage(), transition: Transition.rightToLeftWithFade);
      } else {
        await FirebaseAuth.instance.signInWithProvider(twitterProvider);
        Get.offAll(HomePage(), transition: Transition.rightToLeftWithFade);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message, Colors.black38);
      setState(() {
        _controller.stop();
      });
      log(e.message.toString());
      rethrow;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        backgroundColor: const Color(0xFF6A359C),
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
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const IntroPage(),
                              transition: Transition.leftToRightWithFade);
                        },
                        child: Image.asset(
                          "assets/icons/back-button.png",
                          scale: 18,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                      const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'ArcaMajora3'),
                      )
                    ],
                  ),
                  SizedBox(height: height / 80),
                  SizedBox(
                      height: height / 4.3,
                      child: Lottie.asset(
                          "assets/images/113519-cyber-security.json",
                          controller: _controller)),
                  SizedBox(
                    height: height / 80,
                  ),
                  Column(
                    children: [
                      InputField(
                          icon: "assets/icons/email.png",
                          hintxt: 'Mail',
                          fieldcontroller: _emailController,
                          type: TextInputType.emailAddress),
                      SizedBox(
                        height: height / 35,
                      ),
                      Inputfield4Password(
                        icon: "assets/icons/rotation-lock.png",
                        hintxt: "Password",
                        fieldcontroller: _passwordController,
                        type: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: height / 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: GestureDetector(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ResetPassword();
                                });
                          },
                          child: Container(
                            height: height / 42,
                            width: width / 3.1,
                            decoration: BoxDecoration(
                                color: Colors.purple[300],
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text("forgot password ?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Fox&Cat')),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 25),
                      AppButton(txt: "L O G I N", func: logIn),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Container(
                    height: height / 42,
                    width: width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "first time here ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fox&Cat',
                              color: Colors.white70),
                        ),
                        SizedBox(width: width / 50),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(const SignUp(),
                                transition: Transition.zoom);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Fox&Cat'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height / 20),
                  const Text("----------  OR  ----------",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'koliko')),
                  SizedBox(height: height / 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButtons(
                        img: "assets/images/google.png",
                        ontap: loginGoogle,
                      ),
                      SizedBox(
                        width: width / 15,
                      ),
                      SocialButtons(
                        img: "assets/images/facebook.png",
                        ontap: loginFB,
                      ),
                      SizedBox(
                        width: width / 15,
                      ),
                      SocialButtons(
                        img: "assets/images/twitter.png",
                        ontap: loginTwitter,
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
