import 'package:flutter/material.dart';
import 'package:login_app/common_files/app_constants.dart';
import 'package:login_app/route_navigations/sign_in_page_navigation.dart';
// import 'package:login_app_sample/common_files/app_constants.dart';

import '../common_files/custom_scaffold.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.3),
                    offset: const Offset(0, 0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/hand_phone.jpg',
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      print('error stack $error');
                      return Text('Image failed to load');
                    },
                  ),
                ),
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                AppConstants.welcomeTitle,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                AppConstants.discover,
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInPage);
                },
                child: const Text(
                  AppConstants.homebtnText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
