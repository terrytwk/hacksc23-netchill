import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:netchill/components/user_avatar.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/models/user.dart';
import 'package:screenshot/screenshot.dart';

Future<BitmapDescriptor> getMarkerIconForUser(User user) async {
  final ScreenshotController screenshotController = ScreenshotController();

  final bytes = await screenshotController.captureFromWidget(
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: NetChillColors.gray, width: 1),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.network(user.profilePic),
        ),
      ),
    ),
  );

  return BitmapDescriptor.fromBytes(bytes);
}
