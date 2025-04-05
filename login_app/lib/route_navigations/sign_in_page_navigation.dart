import 'package:flutter/material.dart';
import 'package:login_app/detail_page/home_page.dart';
import 'package:login_app/detail_page/sign_in_page.dart';

class Routes {
  static const String home = '/';
  static const String signInPage = '/signInPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'login_app'),
        );
      case signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());

      default:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'login_app'),
        );
    }
  }
}
