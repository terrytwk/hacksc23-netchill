import 'package:flutter/material.dart';
import 'package:netchill/components/user_avatar.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';

class FindingAvatar extends StatelessWidget {
  const FindingAvatar({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildProfilePic(),
        Positioned(
          bottom: 30,
          child: Center(child: _buildText()),
        ),
      ],
    );
  }

  Widget _buildText() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: NetChillColors.gray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: Text(
          'Looking for ${user.firstName} ${user.lastName}...',
          style: NetChillTextStyles.h2,
        ),
      ),
    );
  }

  Widget _buildProfilePic() {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0x40990000),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Center(
        child: Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            color: const Color(0x40990000),
            borderRadius: BorderRadius.circular(200),
          ),
          child: Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0x40990000),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Container(
                  width: 217,
                  height: 217,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Center(
                    child: UserAvatar(
                      user: user,
                      radius: 100,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
