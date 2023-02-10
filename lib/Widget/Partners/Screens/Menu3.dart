import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../Models/Dimensions/Models_Dimensions.dart';
import '../../../Api/RequestDatabases.dart';
import '../User/Logout.dart';

class Menu3 extends StatefulWidget {
  @override
  State<Menu3> createState() => _Menu3();
}

class _Menu3 extends State<Menu3> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Lottie.asset("assets/animation/Users.json"),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Logout(),
                      ],
                    ),
                  ),
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
}
