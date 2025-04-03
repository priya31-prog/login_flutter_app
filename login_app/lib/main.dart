import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/detail_page/sign_in_page.dart';
// import 'package:login_app_sample/detail_page/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'common_files/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.greenAccent),
        // scaffoldBackgroundColor: bodyGradient,
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Home Page'),
      home: const SignInPage(),
    );
  }
}
