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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
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
            controller: _userNameController,
            decoration: InputDecoration(
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
            controller: _passwordController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              prefixIcon: const Icon(Icons.password_outlined),
              prefixIconColor: Theme.of(context).colorScheme.primary,
            ),
            // style: const TextStyle(color: Colors.green),
          ),
        )
      ],
    ));
  }
}
