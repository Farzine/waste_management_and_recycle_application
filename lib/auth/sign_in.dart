import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/user_provider.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      userProvider.addUserData(
        currentUser: user,
        userName: user!.displayName,
        userImage: user.photoURL,
        userEmail: user.email,
      );

      return user;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background_Image.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              //color: Colors.red,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Garbage',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 13, 139, 22),
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Sign in to continue',
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () {
                          _googleSignUp().then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Facebook,
                        text: "Sign up with Facebook",
                        onPressed: () {
                          _googleSignUp().then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By signing in you are accepting our ',
                        style:
                            TextStyle(color: Color.fromARGB(255, 67, 65, 65)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Terms and Privacy  Policy ',
                        style:
                            TextStyle(color: Color.fromARGB(255, 67, 65, 65)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
