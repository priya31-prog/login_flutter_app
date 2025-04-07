import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/common_files/custom_scaffold.dart';
import 'package:login_app/route_navigations/sign_in_page_navigation.dart';

class LoginWithOtp extends StatefulWidget {
  const LoginWithOtp({super.key});

  @override
  State<LoginWithOtp> createState() => _LoginWithOtp();
}

class _LoginWithOtp extends State<LoginWithOtp> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  String _smsCode = '';
  String _phoneNumber = '';
  bool isOtpVisible = false;
  bool isSmsCodeSent = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> _verifyPhoneNumber() async {
    _phoneNumber = "+917708338491";

    // Set up the reCAPTCHA verifier
    PhoneVerificationCompleted verificationCompleted = (
      PhoneAuthCredential phoneAuthCredential,
    ) async {
      // If the phone number is already verified, sign in
      await _auth.signInWithCredential(phoneAuthCredential);
      print("Phone number automatically verified");
    };

    PhoneVerificationFailed verificationFailed = (
      FirebaseAuthException authException,
    ) {
      print(authException.message);
    };

    PhoneCodeSent codeSent = (
      String verificationId,
      int? forceResendingToken,
    ) async {
      // When the code is sent, update the verification ID
      setState(() {
        _verificationId = verificationId;
      });
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (
      String verificationId,
    ) {
      setState(() {
        _verificationId = verificationId;
      });
    };

    // Send the OTP code to the entered phone number
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      timeout: Duration(seconds: 60),
    );
  }

  Future<void> _signInWithOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _smsCode,
    );
    await _auth.signInWithCredential(credential);
    print('logged in...');
  }

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
                        Navigator.pushNamed(context, Routes.signInPage);
                      },
                      child: Text(
                        'Login through username ?',
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
                        return 'Please enter mobile number';
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Please enter only numbers';
                      }

                      return null;
                    },
                    // autovalidateMode: AutovalidateMode.always,
                    controller: _numberController,
                    maxLength: 12,
                    autofocus: true,
                    decoration: InputDecoration(
                      // error: ,
                      contentPadding: const EdgeInsets.all(8.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      filled: false,
                      focusColor: Theme.of(context).colorScheme.primary,
                      prefixIcon: const Icon(Icons.mobile_friendly),
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
                  child:
                      isOtpVisible
                          ? TextFormField(
                            maxLength: 30,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              String errorMessage = '';

                              if (value == null || value.isEmpty) {
                                return 'Please enter mobile number';
                              }
                              if (!value.contains(RegExp(r'[0-9]'))) {
                                return 'Please enter only numbers';
                              }

                              return errorMessage.isEmpty ? null : errorMessage;
                            },
                            obscureText: isOtpVisible ? false : true,
                            controller: _otpController,

                            // autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8.0),
                              // isCollapsed: true,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                              prefixIcon: const Icon(Icons.numbers),

                              prefixIconColor:
                                  Theme.of(context).colorScheme.primary,
                              suffixIconColor:
                                  Theme.of(context).colorScheme.primary,
                              suffixIcon: IconButton(
                                icon:
                                    isOtpVisible
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    isOtpVisible = !isOtpVisible;
                                  });
                                },
                              ),
                            ),
                            // style: const TextStyle(color: Colors.green),
                          )
                          : SizedBox.shrink(),
                ),

                ElevatedButton.icon(
                  icon:
                      isSmsCodeSent
                          ? Icon(Icons.login_outlined)
                          : SizedBox.shrink(),
                  label:
                      isSmsCodeSent == false
                          ? const Text('Send SMS')
                          : Text('Sign In'),
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
                    print('state of sms send..${isSmsCodeSent}');

                    _formKey.currentState!.validate();
                    await _verifyPhoneNumber();
                    setState(() {
                      isSmsCodeSent = true;
                    });
                    // _signInWithOTP();
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
