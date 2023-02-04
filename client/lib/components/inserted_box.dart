import 'package:flutter/material.dart';
import 'package:netchill/main.dart';
import 'package:netchill/pages/select_interest.dart';

class InterestBox extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const InterestBox({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selected ? Colors.blue : Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
