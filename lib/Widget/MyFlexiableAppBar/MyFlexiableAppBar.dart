import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Tabs_Home/HotelPage.dart';
import './Tabs_Home/GuidePage.dart';
import './Tabs_Home/RelaxPage.dart';
import './Tabs_Home/RestaurantPage.dart';
import './Tabs_Home/ShoppingPage.dart';
import './Tabs_Home/TourPage.dart';
import './Tabs_Home/SosPage.dart';
import '../../Models/Dimensions/Models_Dimensions.dart';

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var Dimensions = new Models_Dimensions();
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return Container(
            padding: EdgeInsets.only(top: statusBarHeight),
            height: statusBarHeight + appBarHeight,
            decoration: const BoxDecoration(
              // color: Color(0xff013db7),
              image: DecorationImage(
                opacity: 0.8,
                image: AssetImage("assets/background/Background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        // color: Colors.black,
                        margin: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 75,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.black,
                              height: 30,
                            ),
                            Container(
                              // color: Colors.white,
                              height: 159,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 250, 246, 246)
                                    .withOpacity(0.9),
                                // borderRadius: const BorderRadius.only(
                                //   topLeft: Radius.circular(8),
                                //   topRight: Radius.circular(8),
                                //   bottomLeft: Radius.circular(8),
                                //   bottomRight: Radius.circular(8),
                                // ),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black54,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        // color: Colors.pink,
                        height: 170,
                        width: 325,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 42,
                                      ),
                                      decoration: const BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color(0xFFF5F5F5),
                                          child: InkWell(
                                            splashColor: Colors.cyan,
                                            onTap: () {
                                              var rount = new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new HotelPage(),
                                              );
                                              Navigator.of(context).push(rount);
                                            },
                                            child: const SizedBox(
                                              width: 56,
                                              height: 56,
                                              child: Icon(
                                                Icons.hotel,
                                                size: 30,
                                                color: Color(0xFF446DFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 12,
                                        right: 42,
                                        top: 8,
                                      ),
                                      child: const Text(
                                        'โรงแรม',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 25,
                                        right: 69,
                                      ),
                                      decoration: const BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color(0xFFF5F5F5),
                                          child: InkWell(
                                            splashColor: Colors.cyan,
                                            onTap: () {
                                              var rount = new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new RestaurantPage(),
                                              );
                                              Navigator.of(context).push(rount);
                                            },
                                            child: const SizedBox(
                                              width: 56,
                                              height: 56,
                                              child: Icon(
                                                Icons.restaurant,
                                                size: 30,
                                                color: Color(0xFF446DFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 52,
                                        top: 8,
                                      ),
                                      child: const Text(
                                        'ร้านอาหาร',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color(0xFFF5F5F5),
                                          child: InkWell(
                                            splashColor: Colors.cyan,
                                            onTap: () {
                                              var rount = new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new TourPage(),
                                              );
                                              Navigator.of(context).push(rount);
                                            },
                                            child: const SizedBox(
                                              width: 56,
                                              height: 56,
                                              child: Icon(
                                                Icons.card_travel,
                                                size: 30,
                                                color: Color(0xFF446DFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: const Text(
                                        'ทัวร์',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.location_pin),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new GuidePage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'ไกด์',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.shopping_cart),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new ShoppingPage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'ช้อปปิ้ง',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.bed_sharp),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new RelaxPage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'พักผ่อน',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.sos_rounded),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new SosPage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'ฉุกเฉิน',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          // ! -------------------------------------------------------------------------------------------
          return Container(
            padding: EdgeInsets.only(top: statusBarHeight),
            height: statusBarHeight + appBarHeight,
            decoration: const BoxDecoration(
              // color: Color(0xff013db7),
              image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage("assets/background/venice.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        // color: Colors.black,
                        margin: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 75,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.black,
                              height: 30,
                            ),
                            Container(
                              // color: Colors.white,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                // borderRadius: const BorderRadius.only(
                                //   topLeft: Radius.circular(8),
                                //   topRight: Radius.circular(8),
                                //   bottomLeft: Radius.circular(8),
                                //   bottomRight: Radius.circular(8),
                                // ),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 9,
                                    color: Colors.black54,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        // color: Colors.pink,
                        height: 170,
                        width: 325,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 42,
                                      ),
                                      decoration: const BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color(0xFFF5F5F5),
                                          child: InkWell(
                                            splashColor: Colors.cyan,
                                            onTap: () {
                                              var rount = new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new HotelPage(),
                                              );
                                              Navigator.of(context).push(rount);
                                            },
                                            child: const SizedBox(
                                              width: 56,
                                              height: 56,
                                              child: Icon(
                                                Icons.hotel,
                                                size: 30,
                                                color: Color(0xFF446DFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 12,
                                        right: 42,
                                        top: 8,
                                      ),
                                      child: const Text(
                                        'โรงแรม',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 25,
                                        right: 69,
                                      ),
                                      decoration: const BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color(0xFFF5F5F5),
                                          child: InkWell(
                                            splashColor: Colors.cyan,
                                            onTap: () {
                                              var rount = new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new RestaurantPage(),
                                              );
                                              Navigator.of(context).push(rount);
                                            },
                                            child: const SizedBox(
                                              width: 56,
                                              height: 56,
                                              child: Icon(
                                                Icons.restaurant,
                                                size: 30,
                                                color: Color(0xFF446DFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 52,
                                        top: 8,
                                      ),
                                      child: const Text(
                                        'ร้านอาหาร',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color(0xFFF5F5F5),
                                          child: InkWell(
                                            splashColor: Colors.cyan,
                                            onTap: () {
                                              var rount = new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new TourPage(),
                                              );
                                              Navigator.of(context).push(rount);
                                            },
                                            child: const SizedBox(
                                              width: 56,
                                              height: 56,
                                              child: Icon(
                                                Icons.card_travel,
                                                size: 30,
                                                color: Color(0xFF446DFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: const Text(
                                        'ทัวร์',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.location_pin),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new GuidePage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'ไกด์',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.shopping_cart),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new ShoppingPage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'ช้อปปิ้ง',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.bed_sharp),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new RelaxPage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        right: 20,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'พักผ่อน',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        // top: 10,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.sos_rounded),
                                        iconSize: 25,
                                        color: Color(0xFF446DFF),
                                        onPressed: () {
                                          var rount = new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new SosPage(),
                                          );
                                          Navigator.of(context).push(rount);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 14.5,
                                        // top: 8,
                                      ),
                                      child: const Text(
                                        'ฉุกเฉิน',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
