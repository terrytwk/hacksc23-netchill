import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/profile_pic.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/components/contact_time_dropdown.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  BottomDrawerController _controller = BottomDrawerController();

  String email = "test@test.com";
  String firstName = "Terry";
  String lastName = "Kim";
  String organization = "USC";
  String position = "student";
  String bio =
      "Hello! I am passionate about mobile app dev and meeting new people!";
  int phone = 2131234567;
  String profilePic =
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg";
  List<String> careerTags = ["web dev", "cyber security", "cloud"];
  List<String> hobbyTags = ["exercise", "hiking"];

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
            imagePath: profilePic,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(firstName, lastName, position, organization),
          const SizedBox(height: 10),
          Text(
            'interested in ${(careerTags + hobbyTags).sublist(0, 3).asMap().entries.map((t) {
              return t.value;
            })}, and ${(careerTags + hobbyTags).length - 3} more'
                .replaceFirst("(", "")
                .replaceFirst(")", ""),
            style: const TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15), //apply padding to all four sides
            child: Text(bio,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center),
          ),
          buildInfo(
            Icons.email_outlined,
            email,
          ),
          buildInfo(
            Icons.phone_outlined,
            "(${phone.toString().substring(0, 3)}) - ${phone.toString().substring(3, 6)} - ${phone.toString().substring(6)}",
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
          DropdownButtonExample()
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
