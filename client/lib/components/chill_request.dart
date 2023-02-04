import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/interests_text.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';

class ChillRequest extends ConsumerWidget {
  const ChillRequest({super.key});

  final String _firstName = 'Jonathan';
  final String _lastName = 'Liu';
  final String _position = 'Computer Science';
  final String _organization = 'USC';

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
      children: [
        // Profile pic
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 10),
        // Info
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$_firstName $_lastName', style: NetChillTextStyles.title),
              Text(
                '$_position @ $_organization',
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
          onPressed: () {},
        ),
      ],
    );
  }
}
