import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var myMarkers = HashSet<Marker>(); //Collection تحديد على الخريطة

  @override
  Widget build(BuildContext context) {

    return Container(
      // padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(31.346207474690633, 34.303320054452094),
            zoom: 14
        ),
        onMapCreated: (GoogleMapController googleMapController){
          setState(() {
            myMarkers.add(Marker(
              markerId: MarkerId("1"),
              position: LatLng(31.346207474690633, 34.303320054452094),
            ),);
          });
        },
        markers: myMarkers,
      ),
    );
  }
}
