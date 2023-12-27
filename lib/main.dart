import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/auth/sign_in.dart';

void main() {
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
