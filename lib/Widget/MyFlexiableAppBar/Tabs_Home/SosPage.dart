import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/Variable/Variable.dart';
import '../../../models/Style/GoogleMap/ThemeSilver.dart';

class SosPage extends StatefulWidget {
  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  var Text_Title = new Data_Variable();
  LatLng currentLocation = LatLng(13.780608841484023, 100.63831080932837);
  Map<String, Marker> _markers = {};
  late GoogleMapController _mapController;
  List<LatLng> listMap = [
    LatLng(13.767474511824524, 100.52510248158646),
    LatLng(12.937289552308348, 100.88691056153594),
    LatLng(7.899450624058688, 98.36846412268197),
    LatLng(17.530044177019647, 102.80005316138451),
    LatLng(18.901839059518306, 98.96245630766904),
  ];
  List<String> Listid = [
    'โรงพยาบาลรามาธิบดี',
    'โรงพยาบาลพัทยาเมโมเรียล',
    'โรงพยาบาลกรุงเทพ สิริโรจน์,',
    'อู่เลิศอุดรการช่าง',
    'โรงพยาบาลเชียงใหม่ราม'
  ];
  List<String> image = [
    'assets/images/Ramathibodi_Hospital.png',
    'assets/images/Bangkok_Hospital_Siriroj.png',
    'assets/images/Pattaya_Memorial_Hospital.png',
    'assets/images/Lert_Udon_Garage_Technician.png',
    'assets/images/Chiang_Mai_Ram_Hospital.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SOS',
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 252, 250, 250),
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 71, 74, 255),
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: currentLocation, zoom: 8 - 2.0),
        onMapCreated: (controller) {
          _mapController = controller;
          controller.setMapStyle(ThemeSilver.mapStyle);
          addMarker();
        },
        markers: _markers.values.toSet(),
      ),
    );
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
