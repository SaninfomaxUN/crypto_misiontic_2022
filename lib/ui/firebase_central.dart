import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_signup_auth/ui/pages/authentication/login.dart';

class FirebaseCentral extends StatelessWidget {
  const FirebaseCentral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LogInScreen();
        }
      },
    );
  }
}