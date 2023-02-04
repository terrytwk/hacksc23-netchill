import 'package:flutter/material.dart';
import 'package:netchill/pages/sign_up.dart';
import 'package:netchill/components/my_textfield_id.dart';
import 'package:netchill/components/my_textfield_pwd.dart';
import 'package:netchill/components/my_button_Id.dart';
import 'package:flutter/gestures.dart';
import 'package:netchill/components/my_button_sign_up.dart';
import 'package:netchill/pages/sign_up_2.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
              SizedBox(height: 85),
              Icon(
                Icons.lock,
                size: 100,
              ),

              // Create Account Textfield
              SizedBox(height: 50),
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 38,
                  fontFamily: 'DMsans',
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Username Textfield
              SizedBox(height: 35),
              MyTextFieldId(
                controller: usernameController,
                hintText: 'Email Address',
                obscureText: false,
              ),

              // Password Textfield
              SizedBox(height: 25),
              MyTextFieldPassword(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              // Sign In Button
              SizedBox(height: 45),

              MyButtonId(
                // need to work on button clicked -> verify the username & password
                onTap: signUserIn,
              ),

              // Don't Have an Account?
              SizedBox(height: 45),

              RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'DMsans',
                    ),
                    children: [
                      TextSpan(
                        text: " Sign Up",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
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
