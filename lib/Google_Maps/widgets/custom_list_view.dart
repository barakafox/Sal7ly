import 'package:flutter/material.dart';
import 'package:sal7ly/Google_Maps/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:sal7ly/Google_Maps/models/place_details_model/place_details_model.dart';
import 'package:sal7ly/Google_Maps/utils/maps_services.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.places, required this.mapsServices, required this.onPlaceSelect});

  final List<PlaceModel> places;
  final MapServices mapsServices;
  final void Function(PlaceDetailsModel) onPlaceSelect;
  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: places.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 0,),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.place),
            title: Text(places[index].description!),
            trailing: IconButton(onPressed: ()async{
              var placeDetails = await mapsServices.getPlaceDetails(placeId: places[index].placeId.toString());
              onPlaceSelect(placeDetails);
            }, icon: Icon(Icons.arrow_forward_ios)),
          );
        },
      ),
    );
  }
}
