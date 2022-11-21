// // ignore_for_file: unnecessary_null_comparison

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login_signup/auth-database/database_services.dart';

// import '../helper/helper_function.dart';

// class AuthService {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   Future registerUserWithEmailandPassword(
//       String fullName, String email, String password) async {
//     try {
//       User user = (await firebaseAuth.createUserWithEmailAndPassword(
//               email: email, password: password))
//           .user!;

//       if (user != null) {
//         await DatabaseServices(uid: user.uid).savingUserData(fullName, email);
//         await HelperFunction.saveUserId(user.uid);
//         await HelperFunction.saveUserLoggedInStatus(true);
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   Future signInWithEmailandPassword(String email, String password) async {
//     try {
//       User user = (await firebaseAuth.signInWithEmailAndPassword(
//               email: email, password: password))
//           .user!;
//       if (user != null) {
//         await HelperFunction.saveUserId(user.uid);
//         await HelperFunction.saveUserLoggedInStatus(true);
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   Future signOut() async {
//     try {
//       await HelperFunction.saveUserLoggedInStatus(false);
//       await HelperFunction.saveUserEmailSF("");
//       await HelperFunction.saveUserNameSF("");
//       await firebaseAuth.signOut();
//     } catch (e) {
//       return null;
//     }
//   }
// }
