import 'package:flutter/material.dart';
import 'package:login_app/detail_page/home_page.dart';
import 'package:login_app/detail_page/logged_in_success_page.dart';
import 'package:login_app/detail_page/login_with_otp.dart';
import 'package:login_app/detail_page/sign_in_page.dart';
import 'package:login_app/new_account/create_account.dart';

class Routes {
  static const String home = '/';
  static const String signInPage = '/signInPage';
  static const String loggedInPage = '/signInPage/loggedInPage';
  static const String loginUsingOtp = '/loginOtp';
  static const String createAccount = '/createAccount';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'login_app'),
        );
      case signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case loggedInPage:
        return MaterialPageRoute(builder: (_) => LoggedInSuccessPage());
      case loginUsingOtp:
        return MaterialPageRoute(builder: (_) => LoginWithOtp());
      case createAccount:
        return MaterialPageRoute(builder: (_) => CreateAccount());
      default:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'login_app'),
        );
    }
  }
}
