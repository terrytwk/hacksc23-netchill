import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/interests_text.dart';
import 'package:netchill/components/user_avatar.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';

class ChillRequest extends ConsumerWidget {
  const ChillRequest({super.key, required this.user, this.onAcceptRequest});

  final User user;
  final VoidCallback? onAcceptRequest;

  final _sharedInterests = const [
    'Photography',
    'Art',
    'Singing',
    'Reading',
    'Dancing',
    'Movies',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile pic
        UserAvatar(user: user, radius: 35),
        const SizedBox(width: 10),
        // Info
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: NetChillTextStyles.title,
              ),
              Text(
                '${user.position} @ ${user.organization}',
                style: NetChillTextStyles.subtitle
                    .copyWith(color: NetChillColors.gray),
              ),
              InterestsText(
                interests: _sharedInterests,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        // Button
        IconButton(
          icon: const Icon(Icons.how_to_reg),
          color: NetChillColors.primary,
          onPressed: onAcceptRequest,
        ),
      ],
    );
  }
}
