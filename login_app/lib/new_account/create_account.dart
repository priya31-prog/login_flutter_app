import 'package:flutter/material.dart';
import 'package:login_app/api/service.dart';
import 'package:login_app/common_files/custom_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String userName = '';

  void clearText() {
    _userNameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  Future<void> saveData(final String username) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString('userName', username);
  }

  Future<String> getData() async {
    final shared = await SharedPreferences.getInstance();
    String? username = shared.getString('userName');
    return username ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Create an account'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.14,
          left: 8,
          right: 8,
        ),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'enter username',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'email',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'password',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Confirm password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 're-enter password',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        //save username in shared preference

                        //use api and post method to add the user to database..

                        userName = _userNameController.text;
                        await RegisterAccount().registerUser(
                          username: userName,
                          password: _passwordController.text,
                          email: _emailController.text,
                        );

                        // print('insie on press --$userName');
                        await saveData(userName);
                        clearText();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Create'),
                    ),
                  ),
                ],
              ),

              // ----demo code to get data---
              // ElevatedButton(
              //   onPressed: () {
              //     getData();
              //     // clearText();
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Theme.of(context).colorScheme.primary,
              //     foregroundColor: Colors.white,
              //   ),
              //   child: Text('getData'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
