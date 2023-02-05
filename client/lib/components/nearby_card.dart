import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/interests_text.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';

class NearbyCard extends ConsumerWidget {
  const NearbyCard({super.key, required this.user, this.onSendRequest});

  final User user;
  final VoidCallback? onSendRequest;

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
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: NetChillColors.gray, width: 1),
      ),
      // height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildProfilePic(),
          ),
          Expanded(
            child: _buildProfileInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePic() {
    // return Container(color: Colors.white, height: 30);
    return FittedBox(
      fit: BoxFit.cover,
      child: Image.network(user.profilePic!),
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text('${user.firstName} ${user.lastName}',
              style: NetChillTextStyles.title),
          const SizedBox(height: 4),
          Text(
            '${user.position} @ ${user.organization}',
            style: NetChillTextStyles.subtitle.copyWith(
              color: NetChillColors.gray,
            ),
          ),
          const SizedBox(height: 4),
          InterestsText(interests: _sharedInterests),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: NetChillColors.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            height: 40,
            width: double.infinity,
            child: Center(
              child: Text(
                'Let\'s chill!',
                style: NetChillTextStyles.button.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
