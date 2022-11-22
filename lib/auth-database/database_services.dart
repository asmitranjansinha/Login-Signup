// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseServices {
//   late final String? uid;
//   DatabaseServices({this.uid});
//   final CollectionReference userCollection =
//       FirebaseFirestore.instance.collection("Users");

//   Future savingUserData(String fullName, String email) async {
//     return await userCollection
//         .doc(uid)
//         .set({"fullName": fullName, "email": email, "uid": uid});
//   }

//   Future gettingUserData(String email) async {
//     QuerySnapshot snapshot =
//         await userCollection.where("email", isEqualTo: email).get();
//     return snapshot;
//   }
// }
