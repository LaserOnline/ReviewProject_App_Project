import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../../../Models/Connect/Connect.dart';
import '../../../Models/Dimensions/Models_Dimensions.dart';
import '../../../Api/RequestDatabases.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var domain = new ApiRequestDatabases();
  String? message;
  String? googleUsername;
  String? googleEmail;
  String? googleProfile;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(248, 19, 19, 19),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 200,
                  alignment: Alignment.topCenter,
                ),
                Stack(
                  children: [
                    Lottie.asset("assets/animation/abstract05.json"),
                    Center(
                      child: Container(
                        width: 300,
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: EmailController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color.fromARGB(255, 252, 255, 254)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color.fromARGB(255, 252, 255, 254)),
                                  ),
                                  filled: true,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 254, 255)),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 245, 243, 243),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: [AutofillHints.email],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 246, 248, 248)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: PasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color.fromARGB(255, 252, 255, 254)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color.fromARGB(255, 252, 255, 254)),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 254, 255)),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Color.fromARGB(255, 248, 244, 244),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: [AutofillHints.password],
                                style: TextStyle(
                                  color: Color.fromARGB(255, 246, 248, 248),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 238, 235, 235),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 98, 86, 202),
                                ),
                                height: 40,
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          FormLogin();
                                        });
                                      },
                                      child: AutoSizeText(
                                        "Sign In",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color.fromARGB(255, 29, 1, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Wrap(
                                children: [
                                  SignInButton(
                                    Buttons.google,
                                    text: "Sign up with Google",
                                    onPressed: () {
                                      if (googleAccount.value == null) {
                                        LoginGoogle();
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future FormLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Login/Login.php?UserEmail=${EmailController.text}&UserPassword=${PasswordController.text}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      if (response.statusCode == 200) {
        sp.setBool("isLogin", true);
        sp.setBool("isLogin", true);
        sp.setInt("Primary_Key", json_res["User"][0]["Primary_Key"]);
        sp.setString("UserKey", json_res['User'][0]['UserKey']);
        sp.setString("UserPlatform", json_res['User'][0]['UserPlatform']);
        sp.setString("UserStstus", json_res['User'][0]['UserStstus']);
        sp.setString("UserEmail", json_res['User'][0]['UserEmail']);
        sp.setString("Username", json_res['User'][0]['Username']);
        sp.setString("UserProfile", json_res['User'][0]['UserProfile']);
        sp.setString("FirstName", json_res['User'][0]['FirstName']);
        sp.setString("LastName", json_res['User'][0]['LastName']);
        sp.setString("Address", json_res['User'][0]['Address']);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Connect()),
          (Route<dynamic> route) => false,
        );
      } else {
        message = json_res["message"];
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('กรุณาตรวจสอบข้อมูล'),
            content: Text("${message}"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (err) {
      print(err);
    }
  }

  LoginGoogle() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    googleAccount.value = await _googleSignin.signIn();
    googleUsername = googleAccount.value?.displayName;
    googleEmail = googleAccount.value?.email;
    googleProfile = googleAccount.value?.photoUrl;
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/SingInGoogle/SingInGoogle.php?UserEmail=${googleEmail}&Username=${googleUsername}&UserProfile=${googleProfile}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);

      if (response.statusCode == 200) {
        googleAccount.value = await _googleSignin.signOut();
        sp.setBool("isLogin", true);
        sp.setInt("Primary_Key", json_res["User"]["Primary_Key"]);
        sp.setString("UserKey", json_res['User']['UserKey']);
        sp.setString("UserPlatform", json_res['User']['UserPlatform']);
        sp.setString("UserStstus", json_res['User']['UserStstus']);
        sp.setString("UserEmail", json_res['User']['UserEmail']);
        sp.setString("Username", json_res['User']['Username']);
        sp.setString("UserProfile", json_res['User']['UserProfile']);
        sp.setString("FirstName", json_res['User']['FirstName']);
        sp.setString("LastName", json_res['User']['LastName']);
        sp.setString("Address", json_res['User']['Address']);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Connect()),
          (Route<dynamic> route) => false,
        );
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('กรุณาตรวจสอบข้อมูล'),
            content: Text(json_res["Status"]),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text('OK'),
              ),
            ],
          ),
        );
        googleAccount.value = await _googleSignin.signOut();
      }
      googleAccount.value = await _googleSignin.signOut();
    } catch (err) {
      print(err);
    }
  }
}
