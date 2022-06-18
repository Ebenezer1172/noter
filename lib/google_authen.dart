// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:noter/home_page.dart';


// GoogleSignIn googleSignIn = GoogleSignIn();
// final FirebaseAuth auth = FirebaseAuth.instance;
// CollectionReference users = FirebaseFirestore.instance.collection('Noters');

// // changing return type to void
// // as bool was not needed here
// void signInWithGoogle(BuildContext context) async {
//   try {
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken);

//       final UserCredential authResult =
//           await auth.signInWithCredential(credential);

//       final User user = authResult.user;

//       var userData = {
//         'name': googleSignInAccount.displayName,
//         'provider': 'google',
//         'email': googleSignInAccount.email,
//       };

//       users.doc(user.uid).get().then((doc) {
//         if (doc.exists) {
//           // old user
//           doc.reference.update(userData);

//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) =>const Home(),
//             ),
//           );
//         } else {
//           // new user

//           users.doc(user.uid).set(userData);

//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) =>const Home(),
//             ),
//           );
//         }
//       });
//     }
//    } 
//   catch (PlatformException) {
//     print(PlatformException);
//      print("Sign in not successful !");
//     // better show an alert here
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:noter/signin.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges =>_firebaseAuth.authStateChanges();

  Future<String?> signIn({String email='',String password=''})async{
try {
await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
return "Signed in";
} on FirebaseAuthException catch(e){
return e.message;
}
  }
  Future<String?> signUp({required String email,required String password})async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    }on FirebaseAuthException catch(e){
      return e.message;
  }
  }
}