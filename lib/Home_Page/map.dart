import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late MapboxMapController mapController;
  late LatLng _center;

  // Example marker position
  final LatLng _markerPosition = LatLng(40.748817, -73.985428); // New York City
  final String _markerDescription = "Empire State Building";

  // User location (this will be fetched dynamically)
  LatLng? _userLocation;

  @override
  void initState() {
    super.initState();
    _center = _markerPosition; // Default center
  }

  // This method is called when the map is created
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;

    // Optionally, enable the user's location (if permissions are granted)
    //mapController.setUserTrackingMode(UserTrackingMode.follow);

  }

  // Method to update the camera position to the user's location
  void _centerOnUserLocation() async {
    if (_userLocation != null) {
      mapController.animateCamera(CameraUpdate.newLatLng(_userLocation!));
    }
  }

  // Adding markers on the map
  void _addMarker() {
    mapController.addSymbol(
      SymbolOptions(
        geometry: _markerPosition,
        iconImage: "assets/marker.png", // Optional: custom marker image
        iconSize: 2.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enhanced Map View with Mapbox"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: _centerOnUserLocation,  // Center on user location when pressed
          ),
        ],
      ),
      body: Stack(
        children: [
          MapboxMap(
            accessToken: "pk.eyJ1IjoibW9oYW1lZG1lZG8xIiwiYSI6ImNtNGloazJnZjAyd2syanF0bjhjMXQ3MWoifQ.Tr9ETgbk-uQ0kCnRqqdyOA",  // Replace with your Mapbox token
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,  // Center on the marker initially
              zoom: 13.0,
            ),
            onStyleLoadedCallback: () {
              _addMarker(); // Add the marker once the map style is loaded
            },
            compassEnabled: true, // Enable compass
            rotateGesturesEnabled: true, // Enable rotation gestures
            scrollGesturesEnabled: true, // Enable scroll (zoom) gestures
            zoomGesturesEnabled: true, // Enable zoom gestures
            tiltGesturesEnabled: true, // Enable tilt gestures
          ),
          // Optional: Custom button to center the map to user's location
          Positioned(
            bottom: 40,
            right: 20,
            child: FloatingActionButton(
              onPressed: _centerOnUserLocation,
              child: Icon(Icons.my_location),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
