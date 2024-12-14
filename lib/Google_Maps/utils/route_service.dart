import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:sal7ly/Google_Maps/models/location_info/location_info.dart';
import 'package:sal7ly/Google_Maps/models/routes_model/routes_model.dart';
import 'package:sal7ly/Google_Maps/models/routes_modifiers.dart';

class RoutesServices {
  final String baseUrl =
      "https://routes.googleapis.com/directions/v2:computeRoutes";
  final String apiKey = "AIzaSyCITazQbM_As4eujaMbvF_RpZdRm8DfoQs";

  Future<RoutesModel> fetchRoutes(
      {required LocationInfoModel origin,
      required LocationInfoModel destination,
      RoutesModifiers? routesModifiers}) async{
    Uri url = Uri.parse("$baseUrl?key=$apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'X-Goog-Api-Key': '$apiKey',
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
    };
    Map<String, dynamic> body = {
      "origin": origin.toJson(),
      "destination": destination.toJson(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers": routesModifiers != null
          ? routesModifiers.toJson()
          : RoutesModifiers().toJson(),
      "languageCode": "en-US",
      "units": "IMPERIAL"
    };
    var response  = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return RoutesModel.fromJson(jsonDecode(response.body));
    }else {
      throw Exception("no routes found");
    }
  }
}
