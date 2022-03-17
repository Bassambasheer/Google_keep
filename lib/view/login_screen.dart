// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginInScreen extends StatelessWidget {
//   LoginInScreen({Key? key}) : super(key: key);
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   signinwithgoogle();
//                 },
//                 child: Card(
//                   color: Colors.grey[100],
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       side: const BorderSide(color: Colors.grey, width: 0.9)),
//                   child: ListTile(
//                     leading: Image.network(
//                       "https://banner2.cleanpng.com/20180324/bwq/kisspng-google-logo-google-adwords-google-panda-chrome-5ab6e660439c29.6670544415219359682769.jpg",
//                       scale: 5,
//                     ),
//                     title: const Text(
//                       "Signin with google",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     trailing: const Icon(Icons.navigate_next_outlined),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   signinwithgoogle() async {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken,accessToken: googleAuth.accessToken);

//   }
// }
