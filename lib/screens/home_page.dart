// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/screens/login_page.dart';
import 'package:login_signup/screens/profile_page.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(() => const LoginPage());
  }

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF6A359C),
              Color(0xFF804FB3),
            ])),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Text("Welcome!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontFamily: GoogleFonts.lato().fontFamily)),
            const SizedBox(height: 10),
            Text(
              "you've made it HOME!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
            const SizedBox(height: 50),
            AppButton(txt: "L O G O U T", func: logOut),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(ProfilePage());
                },
                child: const Text("Profile")),
          ],
        )),
      ),
    );
  }
}
