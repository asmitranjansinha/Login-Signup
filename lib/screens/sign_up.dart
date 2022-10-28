import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const route = 'signup_page';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200],
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_iae48o38.json'),
                Text(
                  'Register Now!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.notoSans().fontFamily),
                ),
                const SizedBox(
                  height: 65,
                ),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FeatherIcons.user,
                          size: 25,
                          color: Colors.blueGrey,
                        ),
                        hintText: "Name",
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white54),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FeatherIcons.mail,
                          size: 25,
                          color: Colors.blueGrey,
                        ),
                        hintText: "E-Mail",
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white54),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FeatherIcons.lock,
                          size: 25,
                          color: Colors.blueGrey,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white54),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FeatherIcons.lock,
                          size: 25,
                          color: Colors.blueGrey,
                        ),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white54),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 13),
                      shape: const StadiumBorder()),
                  child: const Text('S I G N U P',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                ),
                const SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account?",
                      style: TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginPage.route, (route) => false);
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
