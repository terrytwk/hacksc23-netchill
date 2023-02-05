import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:netchill/components/chill_request.dart';
import 'package:netchill/components/nearby_card.dart';
import 'package:netchill/components/person_info.dart';
import 'package:netchill/components/user_avatar.dart';
import 'package:netchill/components/user_marker.dart';
import 'package:netchill/constants/colors.dart';
import 'package:netchill/constants/constants.dart';
import 'package:netchill/constants/text_styles.dart';
import 'package:netchill/models/user.dart';
// import 'package:clippy_flutter/triangle.dart';
import 'package:netchill/providers.dart';
import 'package:screenshot/screenshot.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage> {
  late GoogleMapController _mapController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final LatLng _center = const LatLng(34.020492192410835, -118.28635262924983);
  final LatLng _jonathanPos = const LatLng(34.021124, -118.287147);
  final LatLng _ericPos = const LatLng(34.021337, -118.285902);
  final LatLng _clementPos =
      const LatLng(34.01961185345555, -118.28695344995721);

  BitmapDescriptor? _jonathanIcon;
  BitmapDescriptor? _ericIcon;
  BitmapDescriptor? _clementIcon;

  Set<Marker> _markers = {};

  final BottomDrawerController _bottomDrawerController =
      BottomDrawerController();
  final ScrollController _bottomDrawerScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bottomDrawerScrollController.addListener(() {
      if (_bottomDrawerScrollController.offset < 0) {
        _bottomDrawerController.close();
      }
    });

    _init();
  }

  Future<void> _init() async {
    final icons = await Future.wait([
      getMarkerIconForUser(NetChillConstants.jonathanUser),
      getMarkerIconForUser(NetChillConstants.ericUser),
      getMarkerIconForUser(NetChillConstants.clementUser)
    ]);
    _jonathanIcon = icons[0];
    _ericIcon = icons[1];
    _clementIcon = icons[2];

    _markers = {
      Marker(
        position: _jonathanPos,
        markerId: const MarkerId('jonathan marker'),
        icon: _jonathanIcon!,
        onTap: () {
          _showInfoWindow(_jonathanPos, NetChillConstants.jonathanUser);
        },
      ),
      Marker(
        position: _ericPos,
        markerId: const MarkerId('eric marker'),
        icon: _ericIcon!,
        onTap: () {
          _showInfoWindow(_ericPos, NetChillConstants.ericUser);
        },
      ),
      Marker(
        position: _clementPos,
        markerId: const MarkerId('clement marker'),
        icon: _clementIcon!,
        onTap: () {
          _showInfoWindow(_clementPos, NetChillConstants.clementUser);
        },
      ),
    };

    setState(() {});
  }

  @override
  void dispose() {
    _mapController.dispose();
    _customInfoWindowController.dispose();
    _bottomDrawerScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (argument) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 17,
            ),
            markers: _markers,
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 140,
            width: 200,
            offset: 65,
          ),
          _buildBottomDrawer(),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _customInfoWindowController.googleMapController = controller;
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
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        height: drawerHeight,
        child: CustomScrollView(
          controller: _bottomDrawerScrollController,
          slivers: [
            _buildRequestsHeader(),
            _buildRequests(),
            _buildNearbyHeader(),
            _buildNearby(),
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

  Widget _buildRequestsHeader() {
    final requests = ref.watch(requestsProvider);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
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
      ),
    );
  }

  Widget _buildRequests() {
    final requests = ref.watch(requestsProvider);

    return SliverFixedExtentList(
      itemExtent: 100,
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index < requests.length) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ChillRequest(user: requests[index]),
          );
        }
        return null;
      }),
    );
  }

  Widget _buildNearbyHeader() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          'Nearby',
          style: NetChillTextStyles.h2,
        ),
      ),
    );
  }

  Widget _buildNearby() {
    final nearby = ref.watch(nearbyProvider);

    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 0.65,
      children: nearby.map((user) {
        return NearbyCard(user: user);
      }).toList(),
    );
  }

  void _showInfoWindow(LatLng latLng, User user) {
    _customInfoWindowController.addInfoWindow!(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: NetChillColors.gray),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            PersonInfo(user: user),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                _customInfoWindowController.hideInfoWindow!();
              },
              child: const Text('Let\'s chill!'),
            ),
          ],
        ),
      ),
      latLng,
    );
  }
}
