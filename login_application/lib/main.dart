import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_application/common_files/app_constants.dart';
// import 'package:login_application/detail_page/home_page.dart';
import 'package:login_application/detail_page/sign_in_page.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print('Firebase initialized successfully');
  } catch (e) {
    print('Error initializing firebase $e');
  }

  runApp(const MyApp());
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.greenAccent,
        ),
        // scaffoldBackgroundColor: bodyGradient,
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Home Page'),
      home: const SignInPage(),
    );
  }
}
