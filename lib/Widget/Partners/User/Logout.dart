import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../Api/RequestDatabases.dart';
import '../../../MyPage/SelectScreens.dart';

class Logout extends StatefulWidget {
  @override
  State<Logout> createState() => _Logout();
}

class _Logout extends State<Logout> {
  var exit = new UserLogout();

  Future Api() async {
    exit.Logout();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => SelectScreens()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: 4.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 240, 93, 49),
      ),
      height: 60,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: Api,
            child: AutoSizeText(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 29, 1, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
