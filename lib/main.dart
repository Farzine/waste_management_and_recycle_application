import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDtNbApmLPGl-Ja6F8I7IdBhZZ8ZGQBLrs',
              appId: '1:395828958201:android:fb5c9f5224ffec89406328',
              messagingSenderId: '395828958201',
              projectId: 'garbage-f771e'),
        )
      : await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}
