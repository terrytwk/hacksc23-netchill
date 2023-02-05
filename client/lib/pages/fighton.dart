import 'package:flutter/material.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/pages/sign_up.dart';
import 'package:netchill/components/my_textfield_id.dart';
import 'package:netchill/components/my_textfield_pwd.dart';
import 'package:netchill/components/my_button_goBack.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:netchill/components/divider_text.dart';

class FightOnPage extends StatelessWidget {
  FightOnPage({super.key});

  // text editing controllers

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
              SizedBox(height: 400),
              Text("✌️",
                  style: TextStyle(
                    fontSize: 130,
                  )),

              // Create Account Textfield
              const SizedBox(height: 20),
              SizedBox(
                width: 380,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Raise your hand and make a "fight on" sign to find each other',
                    textAlign: TextAlign.center,
                    style: NetChillTextStyles.h3.copyWith(fontSize: 18),
                  ),
                ),
              ),

              // Username Textfield

              SizedBox(height: 120),

              MyButtonGoBack(
                // need to work on button clicked -> verify the username & password
                onTap: signUserIn,
              ),

              // Don't Have an Account?
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
