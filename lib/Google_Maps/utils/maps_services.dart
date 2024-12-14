import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sal7ly/Google_Maps/models/location_info/lat_lng.dart';
import 'package:sal7ly/Google_Maps/models/location_info/location.dart';
import 'package:sal7ly/Google_Maps/models/location_info/location_info.dart';
import 'package:sal7ly/Google_Maps/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:sal7ly/Google_Maps/models/place_details_model/place_details_model.dart';
import 'package:sal7ly/Google_Maps/models/routes_model/routes_model.dart';
import 'package:sal7ly/Google_Maps/utils/google_maps_place_service.dart';
import 'package:sal7ly/Google_Maps/utils/location_service.dart';
import 'package:sal7ly/Google_Maps/utils/route_service.dart';

class MapServices {
  PlaceService placeService = PlaceService();
  LocationService locationService = LocationService();
  RoutesServices routesServices = RoutesServices();
  LatLng? currentLocation;

  Future<void> getPredictions({required String input, required String sessionToken, required List<PlaceModel> places}) async {
    if (input.isNotEmpty) {
      var result = await placeService.getPredictions(
          sessionToken: sessionToken, input: input);
      places.clear();
      places.addAll(result);
    } else {
      places.clear();
    }
  }

  Future<List<LatLng>> getRoutesData({ required LatLng destination}) async {
    LocationInfoModel destinations = LocationInfoModel(
        location: LocationModel(
      latLng: LatLngModel(
          latitude: destination.latitude, longitude: destination.longitude),
    ));
    LocationInfoModel origin = LocationInfoModel(
        location: LocationModel(
      latLng: LatLngModel(
          latitude: currentLocation!.latitude,
          longitude: currentLocation!.longitude),
    ));

    RoutesModel routes = await routesServices.fetchRoutes(
        origin: origin, destination: destinations);
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> points = getDecodedRoute(polylinePoints, routes);
    return points;
  }


  List<LatLng> getDecodedRoute(
      PolylinePoints polylinePoints, RoutesModel routes) {
    List<PointLatLng> result = polylinePoints.decodePolyline(
      routes.routes!.first.polyline!.encodedPolyline!,
    );

    List<LatLng> points =
    result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

  void displayRoute(List<LatLng> points,
      {required Set<Polyline> polyLines,
      required GoogleMapController googleMapController}) {
    Polyline route = Polyline(
        color: Colors.blueAccent,
        polylineId: const PolylineId("route"),
        points: points,
        width: 9);
    polyLines.add(route);

    LatLngBounds bounds = getLatLngBounds(points);
    googleMapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    var southWestLng = points.first.longitude;
    var southWestLat = points.first.latitude;
    var northEastLng = points.first.longitude;
    var northEastLat = points.first.latitude;
    for (var point in points) {
      southWestLat = min(southWestLat, point.latitude);
      southWestLng = min(southWestLng, point.longitude);
      northEastLat = max(northEastLat, point.latitude);
      northEastLng = max(northEastLng, point.longitude);
    }
    return LatLngBounds(
      northeast: LatLng(northEastLat, northEastLng),
      southwest: LatLng(southWestLat, southWestLng),
    );
  }

  void  updateCurrentLocation(
      {required Set<Marker> markers,
       required Function onUpdateCurrentLocation,
      required GoogleMapController googleMapController}) async {
    locationService.getRealTimeLocationData((locationData) {
       currentLocation = LatLng(locationData.latitude!, locationData.longitude!);

      Marker marker = Marker(
          markerId: const MarkerId("currentLocation"),
          position: currentLocation!
      );

      var myCurrentLocation = CameraPosition
        (target: currentLocation!, zoom: 14);

      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(myCurrentLocation));
      markers.add(marker);
      onUpdateCurrentLocation();
    },);

  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    return await placeService.getPlaceDetails(placeId: placeId);
  }
}
