import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:netchill/components/chill_request.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';
import 'package:netchill/providers.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  final BottomDrawerController _bottomDrawerController =
      BottomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildBottomDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11,
            ),
          ),
          _buildBottomDrawer(),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Widget _buildBottomDrawer() {
    final height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).viewPadding;
    final drawerHeight = height - 1 * (padding.top + padding.bottom);

    return BottomDrawer(
      /// your customized drawer header.
      header: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            Container(
              width: 100,
              height: 7,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: NetChillColors.lightGray,
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),

      /// your customized drawer body.
      body: Container(
        padding: const EdgeInsets.all(32),
        height: drawerHeight,
        child: Column(
          children: [
            Expanded(child: _RequestsSection()),
          ],
        ),
      ),

      /// your customized drawer header height.
      headerHeight: drawerHeight / 3,

      /// your customized drawer body height.
      drawerHeight: drawerHeight,

      /// drawer background color.
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color(0x40000000),
          offset: Offset(0, -1),
          blurRadius: 4,
          spreadRadius: 0.0,
        ),
      ],

      /// drawer controller.
      controller: _bottomDrawerController,
    );
  }
}

class _RequestsSection extends ConsumerWidget {
  const _RequestsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requests = ref.watch(requestsProvider);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Requests',
              style: NetChillTextStyles.h2,
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '${requests.length}',
                  style: NetChillTextStyles.h3.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Expanded(child: _buildRequests(requests)),
      ],
    );
  }

  Widget _buildRequests(List<User> requests) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ChillRequest(user: requests[index]),
        );
      },
    );
  }
}
