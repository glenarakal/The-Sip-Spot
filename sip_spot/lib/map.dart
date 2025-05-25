// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_map/flutter_map.dart';
// // // import 'package:latlong2/latlong.dart';

// // // class MapScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: FlutterMap(
// // //         options: MapOptions(
// // //           center: LatLng(10.0159, 76.3419),
// // //           zoom: 14,
// // //         ),
// // //         children: [
// // //           TileLayer(
// // //             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
// // //             subdomains: ['a', 'b', 'c'],
// // //           ),
// // //           MarkerLayer(
// // //             markers: [
// // //               Marker(
// // //                 width: 80.0,
// // //                 height: 80.0,
                
// // //                 point: LatLng(10.04449, 76.34644),
// // //                 child: Icon(Icons.location_pin, color: Colors.red, size: 40),
// // //               ),
// // //             ],
// // //           ),
         
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:geocoding/geocoding.dart';

// // class MapScreen extends StatefulWidget {
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   MapController mapController = MapController();
// //   LatLng currentLocation = LatLng(10.0159, 76.3419);
// //   List<Marker> markers = [];
// //   TextEditingController searchController = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentLocation();
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     LocationPermission permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
// //       await Geolocator.requestPermission();
// //     }

// //     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// //     setState(() {
// //       currentLocation = LatLng(position.latitude, position.longitude);
// //       markers.add(_buildMarker(currentLocation, "You Are Here", Colors.blue));
// //       mapController.move(currentLocation, 15.0);
// //     });
// //   }

// //   Marker _buildMarker(LatLng point, String label, Color color) {
// //     return Marker(
// //       width: 100.0,
// //       height: 100.0,
// //       point: point,
// //       child: Column(
// //         children: [
// //           Icon(Icons.location_pin, size: 40, color: color),
// //           Text(label, style: TextStyle(fontSize: 12)),
// //         ],
// //       ),
// //     );
// //   }

// //   Future<void> _searchLocation(String address) async {
// //     try {
// //       List<Location> locations = await locationFromAddress(address);
// //       if (locations.isNotEmpty) {
// //         final latLng = LatLng(locations[0].latitude, locations[0].longitude);
// //         setState(() {
// //           markers.add(_buildMarker(latLng, "Search", Colors.green));
// //           mapController.move(latLng, 15.0);
// //         });
// //       }
// //     } catch (e) {
// //       print("Search failed: $e");
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Location not found')));
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Advanced Map"),
// //       ),
// //       body: Stack(
// //         children: [
// //           FlutterMap(
// //             mapController: mapController,
// //             options: MapOptions(
// //               center: LatLng(10.0159, 76.3419),
// //               zoom: 14.0,
// //               onTap: (tapPosition, point) {
// //                 setState(() {
// //                   markers.add(_buildMarker(point, "Custom", Colors.red));
// //                 });
// //               },
// //             ),
// //             children: [
// //               TileLayer(
// //                 urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
// //                 subdomains: ['a', 'b', 'c'],
// //               ),
// //               MarkerLayer(markers: [
// //                 Marker(
// //                   width: 80.0,
// //                   height: 80.0,
// //                   point: LatLng(10.04449, 76.34644),
// //                    child: Icon(Icons.location_pin, color: Colors.red, size: 40),
// //            ) ]),
// //             ],
// //           ),
// //           Positioned(
// //             top: 10,
// //             left: 10,
// //             right: 60,
// //             child: Card(
// //               elevation: 5,
// //               child: TextField(
// //                 controller: searchController,
// //                 onSubmitted: _searchLocation,
// //                 decoration: InputDecoration(
// //                   hintText: "Search location...",
// //                   contentPadding: EdgeInsets.symmetric(horizontal: 10),
// //                   border: InputBorder.none,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             top: 10,
// //             right: 10,
// //             child: FloatingActionButton(
// //               mini: true,
// //               onPressed: _getCurrentLocation,
// //               tooltip: 'My Location',
// //               child: Icon(Icons.my_location),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final MapController mapController = MapController();
//   LatLng currentLocation = LatLng(10.0159, 76.3419);
//   List<Marker> markers = [];
//   final TextEditingController searchController = TextEditingController();
//   final FocusNode searchFocus = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
    
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       await Geolocator.requestPermission();
//     }

//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     setState(() {
//       currentLocation = LatLng(position.latitude, position.longitude);
//       markers.add(_buildMarker(currentLocation, "You Are Here", Colors.blue));
//       mapController.move(currentLocation, 15.0);
//     });
//   }

//   Marker _buildMarker(LatLng point, String label, Color color) {
//     return Marker(
//       width: 100.0,
//       height: 100.0,
//       point: point,
//       child: Column(
//         children: [
//           Icon(Icons.location_pin, size: 40, color: color),
//           Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
//         ],
//       ),
//     );
//   }

//   Future<void> _searchLocation(String address) async {
//     try {
//       List<Location> locations = await locationFromAddress(address);
//       if (locations.isNotEmpty) {
//         final latLng = LatLng(locations[0].latitude, locations[0].longitude);
//         setState(() {
//           markers.add(_buildMarker(latLng, "Search", Colors.green));
//           mapController.move(latLng, 15.0);
//         });
//       }
//     } catch (e) {
//       print("Search failed: $e");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Location not found')));
//     }
//   }

//   void _clearMarkers() {
//     setState(() {
//       markers.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Advanced Map"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.clear_all),
//             onPressed: _clearMarkers,
//             tooltip: "Clear all markers",
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           FlutterMap(
//             mapController: mapController,
//             options: MapOptions(
//               center: currentLocation,
//               zoom: 14.0,
//               onTap: (tapPosition, point) {
//                 setState(() {
//                   markers.add(_buildMarker(point, "Custom", Colors.red));
//                 });
//               },
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 subdomains: ['a', 'b', 'c'],
//               ),
//               MarkerLayer(
//                 markers: [
//                   ...markers,
//                   Marker(
//                     width: 80.0,
//                     height: 80.0,
//                     point: LatLng(10.04449, 76.34644),
//                     child: Icon(
//                       Icons.location_pin,
//                       color: Colors.orange,
//                       size: 40,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Positioned(
//             top: 10,
//             left: 10,
//             right: 60,
//             child: Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 controller: searchController,
//                 focusNode: searchFocus,
//                 onSubmitted: (value) {
//                   if (value.trim().isNotEmpty) {
//                     _searchLocation(value.trim());
//                     searchFocus.unfocus();
//                   }
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search location...",
//                   prefixIcon: Icon(Icons.search),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 10,
//             right: 10,
//             child: FloatingActionButton(
//               mini: true,
//               onPressed: _getCurrentLocation,
//               tooltip: 'My Location',
//               child: Icon(Icons.my_location),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  LatLng currentLocation = LatLng(10.0159, 76.3419); // default fallback
  List<Marker> markers = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enable location services.')),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.always &&
            permission != LocationPermission.whileInUse) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location permission denied.')),
          );
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        markers.add(_buildMarker(currentLocation, "You Are Here", Colors.blue));
        mapController.move(currentLocation, 15.0);
      });
    } catch (e) {
      print("Location error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not get location.')));
    }
  }

  Marker _buildMarker(LatLng point, String label, Color color) {
    return Marker(
      width: 100,
      height: 100,
      point: point,
      child: Column(
        children: [
          Tooltip(
            message: label,
            child: Icon(Icons.location_pin, size: 40, color: color),
          ),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Future<void> _searchLocation(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        final latLng = LatLng(locations[0].latitude, locations[0].longitude);
        setState(() {
          markers.add(_buildMarker(latLng, "Search", Colors.green));
          mapController.move(latLng, 15.0);
        });
      }
    } catch (e) {
      print("Search failed: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Location not found.')));
    }
  }

  void _clearSearch() {
    searchController.clear();
    setState(() {
      markers.removeWhere(
        (marker) =>
            marker.child is Column &&
            ((marker.child as Column).children.last as Text).data == "Search",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Advanced Map")),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: currentLocation,
              zoom: 14.0,
              onTap: (tapPosition, point) {
                setState(() {
                  markers.add(_buildMarker(point, "Custom", Colors.red));
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: markers),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 60,
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onSubmitted: _searchLocation,
                      decoration: InputDecoration(
                        hintText: "Search location...",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.clear), onPressed: _clearSearch),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FloatingActionButton(
              mini: true,
              onPressed: _getCurrentLocation,
              tooltip: 'My Location',
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
