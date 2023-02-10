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

class Trip extends StatefulWidget {
  @override
  State<Trip> createState() => _Trip();
}

class _Trip extends State<Trip> {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Trip',
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              // fontSize: 24,
              color: Color.fromARGB(255, 252, 250, 250),
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 71, 74, 255),
      ),
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
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        child: Center(
                          child: Image.asset(
                            'assets/images/tab_bar.png',
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Calendar',
                            style: GoogleFonts.kanit(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 0, 0, 0),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: TableCalendar(
                          locale: "en_US",
                          rowHeight: 43,
                          headerStyle: HeaderStyle(
                              formatButtonVisible: false, titleCentered: true),
                          availableGestures: AvailableGestures.all,
                          selectedDayPredicate: (day) =>
                              isSameDay(day, checking_today),
                          focusedDay: checking_today,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2023, 10, 16),
                          onDaySelected: _select_chcklout,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 247, 247),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              );
            },
          ),
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
