import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../../../api/RequestDatabases.dart';
import '../../../models/PartnersControl/PartnersControl.dart';

class LoadContent extends StatefulWidget {
  LoadContent(List<XFile> image, String Content_Key) {
    this.imageFileList = image;
    this.Content_Key = Content_Key;
  }
  List<XFile> imageFileList = [];
  String Content_Key = "";
  @override
  State<LoadContent> createState() {
    return _LoadContent(
      imageFileList,
      Content_Key,
    );
  }
}

class _LoadContent extends State<LoadContent> {
  _LoadContent(List<XFile> image, String Content_Key) {
    this.imageFileList = image;
    this.Content_Key = Content_Key;
  }
  List<XFile> imageFileList = [];
  String Content_Key = "";
  String message = "";
  int statuscode = 404;
  int item = 0;
  var domain = new ApiRequestDatabases();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Setup(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color.fromARGB(255, 8, 8, 8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Lottie.asset("assets/animation/Loading01.json"),
                          ],
                        ),
                        AutoSizeText(
                          "${message}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 4.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          width: 60.0,
                          height: 60.0,
                          child: InkWell(
                            child: Icon(Icons.arrow_back_ios_rounded,
                                size: 30,
                                color: Color.fromARGB(255, 255, 250, 250)),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 8, 8, 8),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Lottie.asset("assets/animation/Loading01.json"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future Setup() async {
    try {
      for (var i = 0; i < imageFileList.length; i++) {
        var url = Uri.parse(
            '${domain.domain}Apache/Api_Rbac_Final/Content/Image_Detail/Image_Detail.php');
        final request = http.MultipartRequest('POST', url);
        request.fields['Content_Key'] = Content_Key;
        request.files.add(
            await http.MultipartFile.fromPath('image', imageFileList[i].path));
        final response = await request.send();
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        statuscode = responseJson['StatusCode'];

        if (statuscode == 200) {
          int x = responseJson["Status"];
          item += x;
          if (item == imageFileList.length) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => PartnersControl()),
            );
          }
        } else if (statuscode == 400) {
          message = responseJson['Status'];
        }
      }
    } catch (err) {
      print(err);
    }
  }
}
