import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waste_management_and_recycle_application/providers/checkout_provider.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/providers/service_provider.dart';
import 'package:waste_management_and_recycle_application/providers/user_provider.dart';
import 'package:waste_management_and_recycle_application/providers/wasteType_provider.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServiceProvider>(
          create: (context) => ServiceProvider(),
        ),
        ChangeNotifierProvider<WasteTypeProvider>(
          create: (context) => WasteTypeProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewServiceProvider>(
          create: (context) => ReviewServiceProvider(),
        ),
        ChangeNotifierProvider<CheckOutProvider>(
          create: (context) => CheckOutProvider(),
        ),
      ],
      child: MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
