import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_clone/main.dart';
import 'package:google_keep_clone/view/home_screen.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignInAccount? user;

class LoginInScreen extends StatelessWidget {
  LoginInScreen({Key? key}) : super(key: key);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://d1rytvr7gmk1sx.cloudfront.net/wp-content/uploads/2022/03/Upnote-hero.jpg?x54432",
                scale: 5,
              ),
              minspace,
              minspace,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () async {
                    await signinwithgoogle();
                    final _sharedprefs = await SharedPreferences.getInstance();
                    _sharedprefs.setBool(savekeyname, true);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => HomeScreen()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              const BorderSide(color: Colors.grey, width: 0.9)),
                      child: ListTile(
                        leading: Image.network(
                          "https://banner2.cleanpng.com/20180324/bwq/kisspng-google-logo-google-adwords-google-panda-chrome-5ab6e660439c29.6670544415219359682769.jpg",
                          scale: 5,
                        ),
                        title: const Text(
                          "Signin with google",
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: const Icon(Icons.navigate_next_outlined),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signinwithgoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    user = googleUser;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
