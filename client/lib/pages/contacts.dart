import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/components/contact.dart';
import 'package:netchill/providers.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/servicese/local_notification_service.dart';

class ContactsPage extends ConsumerStatefulWidget {
  const ContactsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactsPageState();
}

class _ContactsPageState extends ConsumerState<ContactsPage> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildBottomDrawer(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 60, bottom: 10, left: 30, right: 30),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: NetChillColors.primary),
                ),
                // box color
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'Search',
                prefixIcon:
                    Icon(Icons.search_outlined, color: Colors.blue[500]),
              ),
            ),
          ),
          Container(
            height: 480,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                _buildRequests(),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await service.showScheduleNOtification(
                    id: 0,
                    title: "NetChilling Time!",
                    body:
                        "We found people nearby that you might be interested in talking to ✌️",
                    seconds: 5);
              },
              child: const Text("Show Local Notification"))
        ],
      ),
    );
  }

  Widget _buildRequests() {
    final requests = ref.watch(nearbyProvider);

    return SliverFixedExtentList(
      itemExtent: 100,
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index < requests.length) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Contact(user: requests[index]),
          );
        }
        return null;
      }),
    );
  }
}
