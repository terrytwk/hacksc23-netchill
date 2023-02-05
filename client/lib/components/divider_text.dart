import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    required this.label,
    required this.height,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 30.0, right: 15.0),
            child: Divider(
              color: Colors.grey,
              height: height,
            )),
      ),
      Text(label, style: TextStyle(color: Colors.grey)),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 30.0),
            child: Divider(
              color: Colors.grey,
              height: height,
            )),
      ),
    ]);
  }
}
