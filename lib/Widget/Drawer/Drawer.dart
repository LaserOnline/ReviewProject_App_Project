import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../SingIn/SingIn.dart';
import '../Drawer/User/Personal.dart';
import '../../Models/Variable/Variable.dart';
import '../../Api/RequestDatabases.dart';
import '../../Models/Loading/Loading.dart';
import '../../models/Dimensions/Models_Dimensions.dart';
import '../SingIn/SingIn.dart';

class DrawerMenu extends StatefulWidget {
  @override
  State<DrawerMenu> createState() => _DrawerMenu();
}

class _DrawerMenu extends State<DrawerMenu> {
  final padding = EdgeInsets.symmetric(horizontal: 10);
  var Dimensions = new Models_Dimensions();
  var domain = new ApiRequestDatabases();

  bool isLogin = false;
  int? Primary_Key;
  String? UserKey;
  String? UserPlatform;
  String? UserStstus;
  String? UserEmail;
  String? Username;
  String? UserProfile;

  Future getuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLogin = sp.getBool("isLogin") ?? false;
    Primary_Key = sp.getInt('Primary_Key') ?? 0;
    UserKey = sp.getString('UserKey') ?? "";
    UserPlatform = sp.getString('UserPlatform') ?? "";
    UserStstus = sp.getString('UserStstus') ?? "";
    UserEmail = sp.getString('UserEmail') ?? "";
    Username = sp.getString('Username') ?? "";
    UserProfile = sp.getString('UserProfile') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getuser(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < mobileWidth) {
                return Container(
                  width: MediaQuery.of(context).size.width *
                      Dimensions.Drawer_Width,
                  height: MediaQuery.of(context).size.height *
                      Dimensions.Drawer_Height,
                  child: Drawer(
                    child: Stack(
                      children: [
                        isLogin != true
                            ? Container(
                                color: Color(0XFF2853AA),
                                child: ListView(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: SingUp(),
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    buildMenuItem(
                                      text: 'Sign In',
                                      icon: Icons.login,
                                      onClicked: () => selectedItem(context, 1),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                color: Color(0XFF2853AA),
                                child: ListView(
                                  children: [
                                    SizedBox(height: 10),
                                    UserPlatform == "ByGoogle"
                                        ? Container(
                                            padding: EdgeInsets.all(5),
                                            child: SignInGoogle(),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(5),
                                            child: SignIn(),
                                          ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    buildMenuItem(
                                      text: 'ข้อมูลส่วนตัว',
                                      icon: Icons.account_box,
                                      onClicked: () => selectedItem(context, 2),
                                    ),
                                    buildMenuItem(
                                      text: 'Logout',
                                      icon: Icons.logout,
                                      onClicked: () => selectedItem(context, 7),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width *
                      Dimensions.Drawer_Width,
                  height: MediaQuery.of(context).size.height *
                      Dimensions.Drawer_Height,
                  child: Drawer(
                    child: Stack(
                      children: [
                        Container(
                          color: Color(0XFF2853AA),
                          child: ListView(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: SingUp(),
                              ),
                              Divider(color: Colors.white),
                              SizedBox(
                                height: 20,
                              ),
                              buildMenuItem(
                                text: 'Register',
                                icon: Icons.account_box,
                                onClicked: () => selectedItem(context, 1),
                              ),
                              buildMenuItem(
                                text: 'Login',
                                icon: Icons.login,
                                onClicked: () => selectedItem(context, 6),
                              ),
                              SizedBox(height: 20),
                              Divider(color: Colors.white),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        }
        return Loading();
      },
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageSingIn(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Personal(),
          ),
        );
        break;
      case 3:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => Favorite(),
        //   ),
        // );
        break;
      case 4:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => Booked(),
        //   ),
        // );
        break;
      case 5:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => TopUp(),
        //   ),
        // );
        break;
      case 6:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageSingIn(),
          ),
        );
        break;
      case 7:
        RemoveUsername();
        break;
      case 8:
        // Update
        break;
    }
  }

  Container SingUp() {
    return Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/User.png"),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Container SignIn() {
    return Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/${UserProfile}"),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "ชื่อ ${Username}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                maxLines: 4,
              ),
              AutoSizeText(
                "Email ${UserEmail}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                maxLines: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container SignInGoogle() {
    return Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage("$UserProfile"),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "ชื่อ ${Username}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                maxLines: 4,
              ),
              AutoSizeText(
                "Email ${UserEmail}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                maxLines: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Null> RemoveUsername() async {
    final sp = await SharedPreferences.getInstance();

    await sp.clear();
  }
}
