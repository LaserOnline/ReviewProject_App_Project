import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
import '../../../models/Dimensions/Models_Dimensions.dart';
import '../../../api/RequestDatabases.dart';
import '../../../MyPage/SelectScreens.dart';
import './Edit/Edit.dart';

class Personal extends StatefulWidget {
  @override
  State<Personal> createState() => _Personal();
}

class _Personal extends State<Personal> {
  var Api = new RequestLogin();
  var domain = new ApiRequestDatabases();

  final TextEditingController FirstNameController = TextEditingController();
  final TextEditingController LastNameController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/images/user.png',
                ),
              )),
            ],
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Image.asset(
                'assets/images/left-arrow01.png',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            'แก้ไขข้อมูล',
            style: GoogleFonts.kanit(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 245, 244, 244),
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 3, 3, 3),
        ),
        body: TabBarView(
          children: [
            Edit(),
          ],
        ),
      ),
    );
  }
}
