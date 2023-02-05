import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/user_avatar.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';

class Contact extends ConsumerWidget {
  Contact({super.key, required this.user, this.onAcceptRequest});

  final User user;
  final VoidCallback? onAcceptRequest;

  List<String> tags = ["Professional", "Startup"];

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
              tag()
            ],
          ),
        )
      ],
    );
  }

  Widget tag() => Row(
        children: tags
            .map((t) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green[200],
                  ),
                  child: Text(t),
                ))
            .toList(),
      );
}
