import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:refri_mobile/const/colors.dart';
import 'package:refri_mobile/firebase_options.dart';
import 'package:refri_mobile/screens/LandingScreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault(widgetsBinding);

  runApp(MaterialApp(
    home: LandingScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: PRIMARY_COLOR, fontFamily: 'NotoSans'),
  ));
}

Future<void> initializeDefault(WidgetsBinding widgetsBinding) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}
