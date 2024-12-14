import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sal7ly/Google_Maps/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:sal7ly/Google_Maps/utils/location_service.dart';
import 'package:sal7ly/Google_Maps/utils/maps_services.dart';
import 'package:sal7ly/Google_Maps/widgets/custom_list_view.dart';
import 'package:sal7ly/Google_Maps/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  late MapServices mapServices;
  late TextEditingController textEditingController;
  late Uuid uuid;
  String? sessionToken;
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  List<PlaceModel> places = [];
  late LatLng destination;
  Timer? debounce;
  @override
  void initState() {
    mapServices = MapServices();
    uuid = const Uuid();
    initialCameraPosition = CameraPosition(target: LatLng(0, 0));
    textEditingController = TextEditingController();
    fetchPredictions();
    super.initState();
  }

  void fetchPredictions() {
    textEditingController.addListener(()  {
      if(debounce?.isActive ?? false){
        debounce?.cancel();
      }
      debounce = Timer(const Duration(milliseconds: 10), () async{
        sessionToken ??= uuid.v4();
        print('session token ${sessionToken}');
        await mapServices.getPredictions(input: textEditingController.text,
            sessionToken: sessionToken!, places: places);
        setState(() {});
      },);

    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    debounce?.cancel();
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       body: SafeArea(
         child: Stack(
          children: [
            GoogleMap(
              polylines: polyLines,
              markers: markers,
              onMapCreated: (controller) {
                googleMapController = controller;
                updateCurrentLocation();
              },
              initialCameraPosition: initialCameraPosition,
            ),
            Positioned(
                right: 16,
                left: 16,
                top: 16,
                child: Column(children: [
                  CustomTextField(
                    textEditingController: textEditingController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomListView(
                    onPlaceSelect: (placeDetailsModel) async {
                      textEditingController.clear();
                      places.clear();
                      sessionToken = null;
                      setState(() {});
                      destination = LatLng(
                          placeDetailsModel.geometry!.location!.lat!
                          ,placeDetailsModel.geometry!.location!.lng!);
               
                      var points  = await mapServices.getRoutesData(destination: destination);
                       mapServices.displayRoute(points,
                          polyLines: polyLines,
                          googleMapController: googleMapController!);
                       setState(() {});
                    },
                    places: places,
                    mapsServices: mapServices,
                  )
                ])),
          ],
               ),
       ),
    );
  }

  void updateCurrentLocation()  {
    try {
      mapServices.updateCurrentLocation(
         onUpdateCurrentLocation: (){
        setState(() {});
         },
         googleMapController: googleMapController!,
         markers: markers

      );
    } on LocationPermissionException catch (e) {
      // TODO
    } on LocationServiceException catch (e) {
      // TODO
    } catch (e) {
      // TODO
    }
  }


}
