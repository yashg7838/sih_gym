import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih_gym/screens/authentication/auth_page.dart';
import 'package:sih_gym/screens/authentication/verify_email_page.dart';
import 'package:sih_gym/screens/client/homePage.dart';
import 'package:sih_gym/screens/gym_client/HomePage.dart';
import 'package:sih_gym/screens/gym_client/registration.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D2727)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Something went wrong!"),);
          }else if (snapshot.hasData){
            return VerifyEmailPage();
          } else {
            return AuthPage();
          }
        }
    ),
  );
}