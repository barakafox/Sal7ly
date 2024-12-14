import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sal7ly/Google_Maps/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:sal7ly/Google_Maps/models/place_details_model/place_details_model.dart';

class PlaceService {
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apiKey = 'AIzaSyBVofSHmm5fYuCQFYHlNSltQJhVjAi1H80';
  Future<List<PlaceModel>> getPredictions({required String input,required String sessionToken}) async{
   var response = await http.get(Uri.parse("$baseUrl/autocomplete/json?input=$input&key=$apiKey&sessiontoken=$sessionToken"));
    if(response.statusCode == 200){
      var data  = jsonDecode(response.body)["predictions"];
      List<PlaceModel> places = [];

      for (var item in data) {
        places.add(PlaceModel.fromJson(item));
      }
      return places;
    }else{
      throw Exception();
    }
  }
  Future<PlaceDetailsModel> getPlaceDetails ({required String placeId}) async{
   var response = await http.get(Uri.parse("$baseUrl/details/json?place_id=$placeId&key=$apiKey"));
    if(response.statusCode == 200){
      var data  = jsonDecode(response.body)["result"];
      return PlaceDetailsModel.fromJson(data);
    }else{
      throw Exception();
    }
  }
}