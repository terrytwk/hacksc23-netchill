import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/interests_text.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';

class PersonInfo extends ConsumerWidget {
  const PersonInfo({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${user.firstName} ${user.lastName}',
          style: NetChillTextStyles.title,
        ),
        const SizedBox(height: 4),
        Text(
          '${user.position} @ ${user.organization}',
          style:
              NetChillTextStyles.subtitle.copyWith(color: NetChillColors.gray),
        ),
        const SizedBox(height: 4),
        InterestsText(
          interests: user.interests,
        ),
      ],
    );
  }
}
