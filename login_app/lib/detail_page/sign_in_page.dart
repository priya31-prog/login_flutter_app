import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/common_files/custom_scaffold.dart';
import 'package:login_app/route_navigations/sign_in_page_navigation.dart';
// import 'package:login_app_sample/common_files/custom_scaffold.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/login_image.jpeg',
                      width: double.infinity,
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Explore more with us..',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'USER LOGIN',
                  // style: GoogleFonts.robotoSerif(
                  //   color: Theme.of(context).colorScheme.primary,
                  //   fontWeight: FontWeight.w700,
                  // ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginUsingOtp);
                      },
                      child: Text(
                        'Login through OTP ?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // top: 30,
                    // left: 30,
                    // right: 30,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
                    },
                    // autovalidateMode: AutovalidateMode.always,
                    controller: _userNameController,
                    maxLength: 50,
                    autofocus: true,
                    decoration: InputDecoration(
                      // error: ,
                      contentPadding: const EdgeInsets.all(8.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      filled: false,
                      focusColor: Theme.of(context).colorScheme.primary,
                      prefixIcon: const Icon(Icons.people_alt_outlined),
                      prefixIconColor: Theme.of(context).colorScheme.primary,
                    ),
                    // style: const TextStyle(color: Colors.green),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    // left: 30,
                    // right: 30,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    maxLength: 30,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      String errorMessage = '';

                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      } else if (value.length < 6) {
                        return 'Password length must be greater than 5';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        errorMessage += 'Uppercase is missing \n';
                        // return _errorMessage;
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        errorMessage += 'Lowercase is missing \n';
                        // return _errorMessage;
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        errorMessage += 'one number is missing \n';
                        // return _errorMessage;
                      }
                      if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                        errorMessage += 'Special character is missing \n';
                        // return _errorMessage;
                      }

                      return errorMessage.isEmpty ? null : errorMessage;
                    },
                    obscureText: isPasswordVisible ? false : true,
                    controller: _passwordController,

                    // autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8.0),
                      // isCollapsed: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      prefixIcon: const Icon(Icons.password_outlined),
                      prefixIconColor: Theme.of(context).colorScheme.primary,
                      suffixIconColor: Theme.of(context).colorScheme.primary,
                      suffixIcon: IconButton(
                        icon:
                            isPasswordVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    // style: const TextStyle(color: Colors.green),
                  ),
                ),
                ElevatedButton.icon(
                  icon: SizedBox.shrink(),
                  label: const Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 12,
                    padding: const EdgeInsets.only(
                      right: 70,
                      left: 70,
                      top: 15,
                      bottom: 15,
                    ),
                  ),
                  onPressed: () async {
                    _formKey.currentState!.validate();
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Create an account',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
