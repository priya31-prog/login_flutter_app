import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_application/common_files/custom_scaffold.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: SingleChildScrollView(
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
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'USER LOGIN',
              style: GoogleFonts.robotoSerif(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: TextFormField(
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
                    prefixIconColor: Theme.of(context).colorScheme.primary),
                // style: const TextStyle(color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: TextFormField(
                maxLength: 30,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the password';
                  }
                  return null;
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
                    icon: isPasswordVisible
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
              icon: const Icon(Icons.login_outlined),
              label: const Text('Sign In'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 12,
                padding: const EdgeInsets.only(
                    right: 70, left: 70, top: 15, bottom: 15),
              ),
              onPressed: () {
                _formKey.currentState!.validate();
              },
            )
          ],
        ),
      ),
    ));
  }
}
