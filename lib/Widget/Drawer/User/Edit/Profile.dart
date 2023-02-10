import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../api/RequestDatabases.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  var domain = new ApiRequestDatabases();
  File? image;
  String UserPlatform = "";
  String UserEmail = "";
  String UserKey = "";
  String UserProfile = "";
  String Test = "";
  String profile = "";
  String username = "";
  String email = "";
  String fname = "";
  String lname = "";
  String address = "";
  String phone = "";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Setup(UserEmail),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 5.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 82, 67, 150),
              ),
              width: 400,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Lottie.asset("assets/animation/abstract08.json"),
                  ),
                  // * Profile
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Stack(
                                children: [
                                  // * By Email

                                  UserPlatform == "ByEmail"
                                      ? Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                offset: Offset(0, 10),
                                              ),
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/${profile}"),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                offset: Offset(0, 10),
                                              ),
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage("$UserProfile"),
                                            ),
                                          ),
                                        ),
                                  UserPlatform == "ByEmail"
                                      ? Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            child: InkWell(
                                              child: Image.asset(
                                                'assets/images/edit01.png',
                                              ),
                                              onTap: (() => pickImage(
                                                  ImageSource.gallery,
                                                  UserKey)),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  // * By Email
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: AutoSizeText(
                                          "${fname}",
                                          style: GoogleFonts.kanit(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 241, 238, 238),
                                            ),
                                          ),
                                          minFontSize: 15,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: AutoSizeText(
                                          "${lname}",
                                          style: GoogleFonts.kanit(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 241, 238, 238),
                                            ),
                                          ),
                                          minFontSize: 15,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AutoSizeText(
                                "${username}",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 241, 238, 238),
                                  ),
                                ),
                                minFontSize: 15,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AutoSizeText(
                                "${email}",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 241, 238, 238),
                                  ),
                                ),
                                minFontSize: 15,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AutoSizeText(
                                "${address}",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 241, 238, 238),
                                  ),
                                ),
                                minFontSize: 12,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AutoSizeText(
                                "${phone}",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 241, 238, 238),
                                  ),
                                ),
                                minFontSize: 15,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
          );
        }
        return LinearProgressIndicator();
      },
    );
  }

  Future Setup(String UserEmail) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    UserProfile = sp.getString('UserProfile') ?? "";
    UserPlatform = sp.getString('UserPlatform') ?? "";
    UserKey = sp.getString('UserKey') ?? "";
    UserEmail = sp.getString('UserEmail') ?? "";

    var url = Uri.parse(
        '${domain.domain}Apache/Api_Rbac_Final/User/Select/User.php?UserEmail=${UserEmail}');
    var response = await http.get(url);
    var json_res = json.decode(response.body);
    email = json_res["User"][0]["UserEmail"];
    username = json_res["User"][0]["Username"];
    profile = json_res["User"][0]["UserProfile"];
    fname = json_res["User"][0]["FirstName"];
    lname = json_res["User"][0]["LastName"];
    phone = json_res["User"][0]["UserPhone"];
    address = json_res["User"][0]["Address"];
  }

  Future pickImage(ImageSource source, String UserKey) async {
    final sp = await SharedPreferences.getInstance();
    sp.remove("UserProfile");
    try {
      var image = await ImagePicker()
          .pickImage(source: source, maxHeight: 720, maxWidth: 1280);
      if (image == null) return;
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Upload_Profile/Upload_Profile.php');
      final request = http.MultipartRequest('POST', url);
      request.fields['UserKey'] = UserKey;
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final responseJson = json.decode(responseBody);

      if (responseJson["StatusCode"] == 200) {
        sp.setString("UserProfile", responseJson["Status"]);
        setState(() {});
      }
    } on PlatformException catch (e) {
      print("Filed to Pick Image $e");
    }
  }
}
