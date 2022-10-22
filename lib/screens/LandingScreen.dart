import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:refri_mobile/App.dart';
import 'package:refri_mobile/screens/SignInScreen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Center(child: CircularProgressIndicator());
        }
        final user = snapshot.data;
        if (user != null) {
          print("user is logged in");
          print(user);
          return App();
        } else {
          print("user is not logged in");
          return SignInScreen();
        }
      },
    );
  }
}
