import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_zh2jz2uz.json'),
            SizedBox(
              width: 330,
              height: 50,
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    icon: const Icon(
                      FeatherIcons.mail,
                      size: 25,
                      color: Colors.blueGrey,
                    ),
                    hintText: "E-Mail",
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white54),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 330,
              height: 50,
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
                obscureText: true,
                decoration: InputDecoration(
                    icon: const Icon(
                      FeatherIcons.lock,
                      size: 25,
                      color: Colors.blueGrey,
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white54),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                  shape: const StadiumBorder()),
              child: Text(
                'L O G I N',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontFamily: GoogleFonts.robotoSlab().fontFamily),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account?",
                  style: TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
