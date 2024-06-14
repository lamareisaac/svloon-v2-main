import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../global/common/common.dart';
import '../../../../global/widgets/info_window/custom_info_window.dart';
import '../../../../global/widgets/info_window/custom_widow.dart';
import '../../../data/model/salon_model.dart';
import '../../cubit/salon_cubit.dart';
import 'model/pin_data_model.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController? googleMapController;

      CustomInfoWindowController controller = CustomInfoWindowController();

 @override
  void initState() {
    _setSourceIcon();
    super.initState();
  }

  Widget _child = Center(
    child: Text('Loading...'),
  );
  BitmapDescriptor? _sourceIcon;

  double _pinPillPosition = -100;

  PinData _currentPinData = PinData(
      pinPath: '',
      avatarPath: '',
      location: LatLng(0, 0),
      locationName: '',
      labelColor: Colors.grey);

  PinData? _sourcePinInfo;

  void _setSourceIcon() async {
    _sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2), 'assets/images/pin.png', // 1
        );
  }

  Set<Marker> markers = Set();

  Future<void> createMarkers(Adresse adress) async {
   double lat = double.tryParse(adress.lat) ?? 0.0;
      double lon = double.tryParse(adress.lon) ?? 0.0;

      markers.add(
        Marker(
            markerId: MarkerId(adress.bail
                .toString()), // Un identifiant unique pour chaque marqueur
            position: LatLng(lat, lon),
            infoWindow: InfoWindow(
              title: adress.addressName, // Nom du salon
              snippet: adress.batimentName
                  .toString(), // Adresse du salon (ou autre information pertinente)
            ),
            onTap: () {
  if (controller.addInfoWindow != null) {
    controller.addInfoWindow!(
      CustomWindow(),
      LatLng(lat, lon),
    );
    setState(() {
      _currentPinData = _sourcePinInfo!;
      _pinPillPosition = 0;
    });
  }
}
            ),
      );
  }

  void _setStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');

    controller.setMapStyle(value);
  }


 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalonCubit, SalonState>(
      builder: (context, state) {
        if (state is GetSalonSuccess) {
          if (state.salon.isNotEmpty) {
            
            for (int i = 0; i < state.salon.length; i++) {
            if (state.salon[i].salon.adresse != null) {
                          createMarkers(state.salon[i].salon.adresse!);

            }
          }
          return GoogleMap(
            mapType: MapType.normal,
            markers: markers,
            initialCameraPosition:
                CameraPosition(target: LatLng(56.1304, -106.3468), zoom: 4.0),
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
            tiltGesturesEnabled: false,
            onTap: (LatLng location) {
              setState(() {
                _pinPillPosition = -100;
              });
            },
          );
          }
          return GoogleMap(
            myLocationButtonEnabled: false,
            
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: LatLng(56.1304, -106.3468), zoom: 4.0),
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
            tiltGesturesEnabled: false,
           
          );
        }else if(state is GetSalonFailure){
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: LatLng(56.1304, -106.3468), zoom: 4.0),
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
            tiltGesturesEnabled: false,
           
          );
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
