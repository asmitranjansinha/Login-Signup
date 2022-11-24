// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  var user = FirebaseAuth.instance.currentUser;

  var exception = false;

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
            Text(
              "Name : ${user!.displayName}",
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Text("Email : ${user!.email}",
                style: const TextStyle(color: Colors.white, fontSize: 25)),
            const SizedBox(height: 50),
          ],
        )),
      ),
    );
  }
}
