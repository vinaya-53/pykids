import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD7GEh_KGHnumi7ynjodJ-bQeFdyhyL1V0",
     authDomain: "pykids-c787c.firebaseapp.com",
     projectId: "pykids-c787c",
     storageBucket: "pykids-c787c.appspot.com",
     messagingSenderId: "537138585350",
     appId: "1:537138585350:web:4ed0d88813fd4bd50e4887",
     measurementId: "G-NNSF479XJH"
    )
     );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return HomePage();
        }
        return LoginPage();
      },
    );
  }
}
