import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:netchill/constants/colors.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  BottomDrawerController _controller = BottomDrawerController();
  double? _height;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(milliseconds: 100), () => _showBottomSheet());
    /// create a bottom drawer controller to control the drawer.
    Future.delayed(
      Duration(milliseconds: 100),
      () => setState(() => _height = MediaQuery.of(context).size.height),
    );
  }

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

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      // useSafeArea: true,
      enableDrag: true,
      builder: (context) {
        return Column(
          children: [
            const Text('hello there'),
            const SizedBox(height: 100),
            const Text('what what'),
          ],
        );
      },
    );
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
        child: SizedBox(child: const Text('hello body')),
      ),

      /// your customized drawer header height.
      headerHeight: drawerHeight / 3,

      /// your customized drawer body height.
      drawerHeight: drawerHeight,

      /// drawer background color.
      color: Colors.white,
      boxShadow: [],

      /// drawer controller.
      controller: _controller,
    );
  }
}
