import 'package:flutter/material.dart';
import 'package:login_app/common_files/custom_scaffold.dart';

class LoggedInSuccessPage extends StatefulWidget {
  const LoggedInSuccessPage({super.key});

  @override
  State<LoggedInSuccessPage> createState() => _LoggedInSuccessPage();
}

class _LoggedInSuccessPage extends State<LoggedInSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: Text('Successfully logged in..'));
  }
}
