import 'package:flutter/material.dart';
import 'package:netchill/components/my_button_to_mainpage.dart';
import 'package:netchill/pages/sign_in.dart';
import 'package:netchill/components/my_textfield_id.dart';
import 'package:netchill/components/my_textfield_pwd.dart';
import 'package:netchill/components/my_button_Id.dart';
import 'package:flutter/gestures.dart';
import 'package:netchill/components/my_button_sign_up.dart';
import 'package:netchill/components/my_textfield_setup.dart';
import 'package:get/get.dart';

class SignUpPage2 extends StatelessWidget {
  SignUpPage2({super.key});

  // text editing controllers
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final positionController = TextEditingController();
  final organizationController = TextEditingController();

  // sign user in
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 5),
              Icon(
                Icons.lock,
                size: 100,
              ),

              // Create Account Textfield
              SizedBox(height: 50),
              Text(
                "Let\'s get set up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 38,
                  fontFamily: 'DMsans',
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Username Textfield
              SizedBox(height: 35),
              MyTextFieldSetup(
                controller: firstnameController,
                hintText: 'First Name',
                obscureText: false,
              ),

              SizedBox(height: 10),
              MyTextFieldSetup(
                controller: lastnameController,
                hintText: 'Last Name',
                obscureText: false,
              ),

              SizedBox(height: 10),
              MyTextFieldSetup(
                controller: positionController,
                hintText: 'Position',
                obscureText: false,
              ),

              SizedBox(height: 10),
              MyTextFieldSetup(
                controller: organizationController,
                hintText: 'Organization',
                obscureText: false,
              ),

              // Don't Have an Account?
              SizedBox(height: 20),
              MyButtonMainpage(
                // need to work on button clicked -> verify the username & password
                onTap: signUserIn,
              ),

              SizedBox(height: 25),
              RichText(
                text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'DMsans',
                    ),
                    children: [
                      TextSpan(
                        text: " Sign In",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                              ),
                      ),
                    ]),
              ),
              // need to be added
            ],
          ),
        ),
      ),
    );
  }
}
