// import 'package:login_signup/main.dart';

// class HelperFunction {
//   static String userLoggedInKey = "LOGGEDINKEY";
//   static String userNameKey = "USERNAMEKEY";
//   static String userEmailKey = "USEREMAILKEY";
//   static String userId = "USERID";

//   static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
//     return await prefs.setBool(userLoggedInKey, isUserLoggedIn);
//   }

//   static Future<bool> saveUserNameSF(String userName) async {
//     return await prefs.setString(userNameKey, userName);
//   }

//   static Future<bool> saveUserEmailSF(String userEmail) async {
//     return await prefs.setString(userEmailKey, userEmail);
//   }

//   static Future<bool> saveUserId(String uid) async {
//     return await prefs.setString(userId, uid);
//   }

//   static Future<bool?> getUserLoggedInStatus() async {
//     return prefs.getBool(userLoggedInKey);
//   }

//   static Future<String?> getUserId() async {
//     return prefs.getString(userId);
//   }

//   static Future<String?> getUserNameFromSf() async {
//     return prefs.getString(userNameKey);
//   }

//   static Future<String?> getUserEmailFromSF() async {
//     return prefs.getString(userEmailKey);
//   }
// }
