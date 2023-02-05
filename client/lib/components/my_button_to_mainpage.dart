import 'package:flutter/material.dart';
import 'package:netchill/main.dart';
import 'package:netchill/pages/select_interest.dart';

class MyButtonMainpage extends StatelessWidget {
  final Function() onTap;

  const MyButtonMainpage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            "Let's Chill",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
