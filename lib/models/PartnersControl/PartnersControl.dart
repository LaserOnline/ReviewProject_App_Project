import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rbac_project_final/Api/RequestDatabases.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../Api/RequestDatabases.dart';
import './Page/Page.dart';
import '../Loading/Loading.dart';
import '../Dimensions/Models_Dimensions.dart';
import '../../Widget/SingIn/SingIn.dart';
import '../../Models/Connect/Connect.dart';

class PartnersControl extends StatefulWidget {
  @override
  State<PartnersControl> createState() => _PartnersControl();
}

var Select = SelectPage();

class _PartnersControl extends State<PartnersControl> {
  var M = new Models_Dimensions();
  var User = new UserLogout();
  bool isLogin = false;
  Conenct() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLogin = sp.getBool("isLogin") ?? false;
  }

  @override
  void initState() {
    super.initState();
    Conenct();
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return Scaffold(
            body: Select.Page[Select.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color.fromARGB(255, 0, 0, 0),
              unselectedItemColor: Color.fromARGB(255, 252, 250, 250),
              iconSize: M.M_Bottom_Nav_Bar,
              selectedFontSize: M.M_SelectedFontSize,
              unselectedFontSize: M.S_UnselectedFontSize,
              currentIndex: Select.currentIndex,
              onTap: (index) => setState(() => Select.currentIndex = index),
              backgroundColor: Color.fromARGB(255, 77, 70, 85),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_rounded,
                  ),
                  label: 'User',
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Select.Page[Select.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF446DFF),
              unselectedItemColor: Colors.grey[400],
              iconSize: M.S_Bottom_Nav_Bar,
              selectedFontSize: M.S_SelectedFontSize,
              unselectedFontSize: M.S_UnselectedFontSize,
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
