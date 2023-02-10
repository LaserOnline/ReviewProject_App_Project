import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../SingIn/SingIn.dart';
import '../../../Api/RequestDatabases.dart';
import '../../../Models/Dimensions/Models_Dimensions.dart';

class AdminLogout extends StatefulWidget {
  @override
  State<AdminLogout> createState() => _AdminLogout();
}

class _AdminLogout extends State<AdminLogout> {
  var Api = new UserLogout();
  Logout() async {
    Api.Logout();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => PageSingIn()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Color.fromARGB(255, 32, 32, 32),
      width: 100.0,
      height: 100.0,
      child: InkWell(
        child: Icon(Icons.logout, size: 50, color: Colors.red),
        onTap: () {
          Logout();
        },
        // onTap: RemoveUsername,
      ),
    );
  }
}
