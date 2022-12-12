import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'directions_model.dart';
import 'directions_repository.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.345570, 69.284599),
    zoom: 12.5,
  );

  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.5,
        title: const Text(
          'Google Maps',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController!.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController!.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController!.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    ;
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        _destination = null;
        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      final directions = await DirectionsRepository()
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:phone_otp_ui/utils/constants.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);

//   @override
//   State<MapPage> createState() => MapPageState();
// }

// class MapPageState extends State<MapPage> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng sourceLocation = LatLng(41.345570, 69.284599);
//   static const LatLng destination = LatLng(41.335570, 69.294599);

//   List<LatLng> polylineCordinates = [];
//   LocationData? currentLocation;

//   BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor currentLocIcon = BitmapDescriptor.defaultMarker;

//   void getCurrentLocation() async {
//     Location location = Location();
//     location.getLocation().then((location) {
//       currentLocation = location;
//       setState(() {});
//     });
//     GoogleMapController googleMapController = await _controller.future;

//     location.onLocationChanged.listen((newLocation) {
//       currentLocation = newLocation;
//       googleMapController.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(
//               zoom: 13.5,
//               target: LatLng(newLocation.latitude!, newLocation.latitude!))));
//       setState(() {});
//     });
//   }

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       google_api_key,
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach(
//         (PointLatLng point) =>
//             polylineCordinates.add(LatLng(point.latitude, point.longitude)),
//       );
//       setState(() {});
//     }
//   }

//   void setCustomMarkerIcon() {
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/Pin_source.png")
//         .then((icon) => sourceIcon = icon);
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/Badge.png")
//         .then((icon) => currentLocIcon = icon);
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/Pin_destination.png")
//         .then((icon) => destinationIcon = icon);
//   }

//   @override
//   void initState() {
//     getCurrentLocation();
//     getPolyPoints();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Track order",
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//       ),
//       body: currentLocation == null
//           ? const Center(child: Text("Loading"))
//           : GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(
//                     currentLocation!.latitude!, currentLocation!.latitude!),
//                 zoom: 13.5,
//               ),
//               polylines: {
//                 Polyline(
//                     polylineId: PolylineId("route"),
//                     points: polylineCordinates,
//                     color: primaryColor,
//                     width: 6)
//               },
//               markers: {
//                 Marker(
//                     markerId: const MarkerId("current Location"),
//                     icon: currentLocIcon,
//                     position: LatLng(currentLocation!.latitude!,
//                         currentLocation!.latitude!)),
//                 Marker(
//                     icon: sourceIcon,
//                     markerId: MarkerId("source"),
//                     position: sourceLocation),
//                 Marker(
//                     icon: destinationIcon,
//                     markerId: MarkerId("destination"),
//                     position: destination),
//               },
//               onMapCreated: (mapController) {
//                 _controller.complete(mapController);
//               },
//             ),
//     );
//   }
// }
