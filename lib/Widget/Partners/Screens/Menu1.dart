import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../Models/Dimensions/Models_Dimensions.dart';
import '../../../Api/RequestDatabases.dart';
import '../MenuItem/MenuContent.dart';
import '../MenuItem/MenuShopping.dart';
import '../MenuItem/MenuGuide.dart';
import '../MenuItem/MenuTour.dart';
import '../MenuItem/MenuHotel.dart';

class Menu1 extends StatefulWidget {
  @override
  State<Menu1> createState() => _Menu1();
}

class _Menu1 extends State<Menu1> {
  var Api = new RequestLogin();
  var domain = new ApiRequestDatabases();
  String? UserKey;
  String? Username;
  String? UserProfile;
  UserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Username = sp.getString('Username') ?? "";
    UserProfile = sp.getString('UserProfile') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < mobileWidth) {
                return Scaffold(
                    // backgroundColor: Colors.blue[800],
                    body: Stack(
                  children: [
                    Lottie.asset("assets/animation/abstract02.json"),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          "${Username}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/${UserProfile}"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      "เมนู หลัก",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                // ! เมนู หลัก
                                Wrap(
                                  children: [
                                    MenuContent(),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    MenuHotel(),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    MenuGuide(),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    MenuTour(),
                                    SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                ),
                                // ! เมนู หลัก
                              ],
                            ),
                          ),
                          // ---
                          SizedBox(
                            height: 25,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(25),
                              color: Colors.grey[200],
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "เมนู ทั้งหมด",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.favorite),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Speaking Skills",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "16 Exercises",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.more_horiz),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
              } else {
                return Scaffold(
                  body: Text("ยังไมได้ทำ"),
                );
              }
            },
          );
        }
        return LinearProgressIndicator();
      },
    );
  }
}
