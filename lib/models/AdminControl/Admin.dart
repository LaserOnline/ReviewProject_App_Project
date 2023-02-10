import 'package:alert/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import '../../Widget/Admin/User/Logout.dart';
import '../../Api/RequestDatabases.dart';
import '../Dimensions/Models_Dimensions.dart';

class AdminControl extends StatefulWidget {
  @override
  State<AdminControl> createState() => _AdminControl();
}

class _AdminControl extends State<AdminControl> {
  var User = new UserLogout();
  Future test() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: test(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < mobileWidth) {
                  return SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "Admin Control",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 4,
                                ),
                                AutoSizeText(
                                  "Welcome ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "User Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.contacts_rounded,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Username");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Partners Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.co_present,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Username");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Landmark Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.cottage,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Landmark");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Content Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Content Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Hotel Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.apartment,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Hotel");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Hotel Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Hotel Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Restaurant Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.fastfood,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Restaurant");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Restaurant Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Restaurant Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Hotel Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.apartment,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Hotel");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Hotel Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Hotel Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Tour Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.tour,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Tour");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Tour Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Tour Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Guide Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.fmd_good_rounded,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Guide");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Guide Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Guide Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Shop Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.local_mall,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Shop");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Shop Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Shop Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(
                              "Relaxing Control",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(
                                        Icons.sentiment_very_satisfied_sharp,
                                        size: 50,
                                        color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Relaxing");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.border_color_outlined,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Relaxing Edit");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  width: 100.0,
                                  height: 100.0,
                                  child: InkWell(
                                    child: Icon(Icons.delete,
                                        size: 50, color: Colors.red),
                                    onTap: () {
                                      //action code when clicked
                                      print("Relaxing Delete");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 15.0),
                            child: AutoSizeText(
                              "Logout",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          AdminLogout(),
                        ],
                      ),
                    ),
                  );
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
      ),
    );
  }
}
