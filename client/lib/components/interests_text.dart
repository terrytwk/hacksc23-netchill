import 'package:flutter/material.dart';
import 'package:netchill/constants/text_styles.dart';

class InterestsText extends StatelessWidget {
  const InterestsText({
    super.key,
    required this.interests,
  });

  final List<String> interests;

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> children = [const TextSpan(text: 'Interested in ')];

    for (int i = 0; i < interests.length; ++i) {
      final interest = interests[i];
      if (i >= 3) {
        children.add(const TextSpan(text: ', and '));
        children.add(TextSpan(
          text: '${interests.length - i} more',
          style: NetChillTextStyles.smallBold,
        ));
        break;
      } else if (i != 0 && i == interests.length - 1) {
        if (i == 1) {
          children.add(const TextSpan(text: ' and '));
        } else {
          children.add(const TextSpan(text: ', and '));
        }
        children.add(TextSpan(
          text: interest,
          style: NetChillTextStyles.smallBold,
        ));
      } else {
        if (i == 0) {
          children.add(TextSpan(
            text: interest,
            style: NetChillTextStyles.smallBold,
          ));
        } else {
          children.add(TextSpan(
            text: ', $interest',
            style: NetChillTextStyles.smallBold,
          ));
        }
      }
    }

    return RichText(
      text: TextSpan(
        style: NetChillTextStyles.small.copyWith(color: Colors.black),
        children: children,
      ),
    );
  }
}
