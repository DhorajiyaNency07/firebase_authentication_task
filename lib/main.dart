import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_task/screens/email_pass_auth_screens/email_pass_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/email_pass_auth_screens/ragistration_screen.dart';
import 'screens/email_pass_auth_screens/sing_up_email_pass_screen.dart';
import 'screens/google_auth_screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //================================= GOOGLE AUTH SCREEN============================
      // home: const HomeScreen(),
      //================================= Email Pass SCREEN============================
      // home: const RegisterScreen(),
      // home: const LoginScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}


///
///
// Platform  Firebase App Id
// web       1:208133681681:web:94b524daf2d0085ffaf7b0
// android   1:208133681681:android:ccf9df65aa6df027faf7b0
// ios       1:208133681681:ios:32517f818f3507a8faf7b0

