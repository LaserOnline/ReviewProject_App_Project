import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import '../Models/AdminControl/Admin.dart';
import '../Api/RequestDatabases.dart';
import '../../models/Dimensions/Models_Dimensions.dart';
import '../Models/Connect_Failed/Connect_Failed.dart';
import '../Models/Connect/Connect.dart';
import '../../models/Page/Page.dart';
import '../Models/Loading/Loading.dart';
import '../Widget/Drawer/Drawer.dart';
import '../MyPage/Screens/Screens_Home.dart';
import '../Models/PartnersControl/PartnersControl.dart';
import '../Models/AdminControl/Admin.dart';
import '../Widget/Drawer/Drawer.dart';

class SelectScreens extends StatefulWidget {
  @override
  State<SelectScreens> createState() => _SelectScreens();
}

class _SelectScreens extends State<SelectScreens> {
  var Api = new ApiRequestDatabases();
  var Dimensions = Models_Dimensions();
  var Select = SelectPage();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return Scaffold(
            body: Select.Page[Select.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF446DFF),
              unselectedItemColor: Colors.grey[400],
              iconSize: Dimensions.M_Bottom_Nav_Bar,
              selectedFontSize: Dimensions.M_SelectedFontSize,
              unselectedFontSize: Dimensions.S_UnselectedFontSize,
              currentIndex: Select.currentIndex,
              onTap: (index) => setState(() => Select.currentIndex = index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'หน้าแรก',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories_outlined),
                  label: 'ดีล',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.flutter_dash_sharp),
                  label: 'ค้นหา',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'ทริป',
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            drawer: DrawerMenu(),
            body: Select.Page[Select.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF446DFF),
              unselectedItemColor: Colors.grey[400],
              iconSize: Dimensions.S_Bottom_Nav_Bar,
              selectedFontSize: Dimensions.S_SelectedFontSize,
              unselectedFontSize: Dimensions.S_UnselectedFontSize,
              currentIndex: Select.currentIndex,
              onTap: (index) => setState(() => Select.currentIndex = index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'หน้าแรก',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories_outlined),
                  label: 'ดีล',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.flutter_dash_sharp),
                  label: 'ค้นหา',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'ทริป',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
