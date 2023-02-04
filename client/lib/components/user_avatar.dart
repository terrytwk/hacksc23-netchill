import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/models/user.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.user,
    this.radius,
    this.onPressed,
    this.photoOverride,
  });

  final User user;
  final double? radius;
  final VoidCallback? onPressed;
  final Uint8List? photoOverride;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          foregroundColor: Colors.white,
          backgroundColor: NetChillColors.gray,
          foregroundImage: _buildImage(),
          child: _hasPicture()
              ? const CircularProgressIndicator()
              : Text(_getInitials()),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }

  ImageProvider? _buildImage() {
    if (photoOverride != null) {
      return Image.memory(photoOverride!).image;
    }

    if (_hasPicture()) {
      return CachedNetworkImageProvider(user.profilePic!);
    }

    return null;
  }

  String _getInitials() {
    String s = '';
    if (user.firstName != null && user.firstName!.isNotEmpty) {
      s += user.firstName![0];
    }
    if (user.lastName != null && user.lastName!.isNotEmpty) {
      s += user.lastName![0];
    }
    return s;
  }

  bool _hasPicture() {
    return user.profilePic != null && user.profilePic!.isNotEmpty;
  }
}
