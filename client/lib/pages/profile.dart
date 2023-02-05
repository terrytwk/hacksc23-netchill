import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/profile_pic.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/components/contact_time_dropdown.dart';
import 'package:netchill/components/interests_text.dart';
import 'package:netchill/models/user.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  BottomDrawerController _controller = BottomDrawerController();

  // String email = "test@test.com";
  // String firstName = "Terry";
  // String lastName = "Kim";
  // String organization = "USC";
  // String position = "student";
  // String bio =
  //     "Hello! I am passionate about mobile app dev and meeting new people!";
  // int phone = 2131234567;
  // String profilePic =
  //     "https://lh3.googleusercontent.com/u/0/drive-viewer/AAOQEOSGCu-HnDnwFi3UOu-mCUS9m7LIx_biZ-ElPay5yOwbY7BvfVCszj8KTO6RnApKKKxQVslYlHdJK8YOTwNM9kxU53mW=w2548-h1906";
  // List<String> careerTags = ["web dev", "cyber security", "cloud"];
  // List<String> hobbyTags = ["exercise", "hiking"];

  @override
  void initState() {
    super.initState();
    // fetch profile info
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70),
          ProfilePic(
            imagePath: widget.user.profilePic,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(widget.user.firstName, widget.user.lastName,
              widget.user.position, widget.user.organization),
          const SizedBox(height: 10),
          InterestsText(interests: widget.user.interests),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15), //apply padding to all four sides
            child: Text(widget.user.bio,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center),
          ),
          buildInfo(
            Icons.email_outlined,
            widget.user.email,
          ),
          buildInfo(
            Icons.phone_outlined,
            "(${widget.user.phone.toString().substring(0, 3)}) - ${widget.user.phone.toString().substring(3, 6)} - ${widget.user.phone.toString().substring(6)}",
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: const [
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: NetChillColors.primary, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Write a note...'),
                )
              ])),
          Column(children: const [
            SizedBox(height: 20),
            Text("Reminder to contact frequency: ",
                style: TextStyle(
                  fontSize: 16,
                )),
            DropdownButtonExample()
          ])
        ],
      ),
    );
  }

  Widget buildName(String firstName, String lastName, String position,
          String organization) =>
      Column(children: [
        Text('$firstName $lastName',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        const SizedBox(height: 4),
        Text('$position @ $organization',
            style: const TextStyle(color: Colors.grey))
      ]);

  Widget buildInfo(IconData icon, String info) => Row(children: [
        const SizedBox(width: 30, height: 30),
        Icon(
          icon,
          size: 20,
          color: Colors.black87,
        ),
        const SizedBox(width: 10),
        Text(info)
      ]);
}
