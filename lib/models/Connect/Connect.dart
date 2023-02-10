import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AdminControl/Admin.dart';
import '../PartnersControl/PartnersControl.dart';
import '../../Api/RequestDatabases.dart';
import '../../models/Connect_Failed/Connect_Failed.dart';
import '../Dimensions/Models_Dimensions.dart';
import '../../MyPage/SelectScreens.dart';
import '../Loading/Loading.dart';

class Connect extends StatefulWidget {
  @override
  State<Connect> createState() => _Connect();
}

class _Connect extends State<Connect> {
  var Api = new ApiRequestDatabases();
  String? UserStstus;
  Future getuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    UserStstus = sp.getString('UserStstus') ?? "";
    if (UserStstus == "Admin") {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => AdminControl()),
        (Route<dynamic> route) => false,
      );
    }
    if (UserStstus == "Partners") {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => PartnersControl()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Future SetUp() async {
    await Api.RequestConnect();
    getuser();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SetUp(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (Api.StatusConnect) {
            if (UserStstus == "Admin") {
              return AdminControl();
            } else if (UserStstus == "Partners") {
              return PartnersControl();
            } else {
              return SelectScreens();
            }
          } else {
            return Connect_Failed();
          }
        }
        return Loading();
      },
    );
  }
}
