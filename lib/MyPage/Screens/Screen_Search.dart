import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_rbac_project_final/models/Variable/Variable.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/Style/GoogleMap/ThemeDark.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  LatLng currentLocation = LatLng(13.780608841484023, 100.63831080932837);
  Map<String, Marker> _markers = {};
  late GoogleMapController _mapController;
  List<LatLng> listMap = [
    LatLng(13.76277401284803, 100.50197522808371),
    LatLng(18.84373515693018, 98.94122184652731),
    LatLng(8.063530141203081, 98.33445152046154),
    LatLng(12.925633570986811, 100.8936424729568),
  ];
  List<String> Listid = ['Bangkok', 'Chiang Mai', 'Phuket,', 'Pattaya'];
  List<String> image = [
    'assets/images/bangkok.png',
    'assets/images/ChiangMai.png',
    'assets/images/Phuket.png',
    'assets/images/Pattaya.png',
  ];
  DateTime checking_today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // * Google
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: currentLocation, zoom: 8 - 2.0),
            onMapCreated: (controller) {
              _mapController = controller;
              controller.setMapStyle(ThemeDark.mapStyle);
              addMarker();
            },
            markers: _markers.values.toSet(),
          ),
          // * Google
        ],
      ),
    );
  }

  void _select_chcklout(DateTime day, DateTime focusedDay) {
    setState(() {
      checking_today = day;
      print(checking_today);
    });
  }

  addMarker() async {
    // var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
    //     .buffer
    //     .asUint8List();

    for (var i = 0; i < Listid.length; i++) {
      var markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        image[i],
      );
      var marker = Marker(
        markerId: MarkerId(Listid[i]),
        position: listMap[i],
        infoWindow: InfoWindow(
          title: Listid[i].toString(),
          snippet: Listid[i].toString(),
        ),
        // icon: markerIcon,
        icon: markerIcon,
      );
      _markers[Listid[i]] = marker;
    }
    setState(() {});
  }
}
