import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../MyPage/SelectScreens.dart';
import '../../../../Api/RequestDatabases.dart';
import '../Register/OTP_Register.dart';

class Loading extends StatefulWidget {
  Loading(String status, String Platform, String Email, String Username,
      String Password, String CheckPass) {
    this.status = status;
    this.Platform = Platform;
    this.Email = Email;
    this.Username = Username;
    this.Password = Password;
    this.CheckPass = CheckPass;
  }
  String status = "";
  String Platform = "";
  String Email = "";
  String Username = "";
  String Password = "";
  String CheckPass = "";
  @override
  State<Loading> createState() {
    return _Loading(status, Platform, Email, Username, Password, CheckPass);
  }
}

class _Loading extends State<Loading> {
  _Loading(String status, String Platform, String Email, String Username,
      String Password, String CheckPass) {
    this.status = status;
    this.Platform = Platform;
    this.Email = Email;
    this.Username = Username;
    this.Password = Password;
    this.CheckPass = CheckPass;
  }
  String status = "";
  String Platform = "";
  String Email = "";
  String Username = "";
  String Password = "";
  String CheckPass = "";
  String message = "";
  String otp = "";
  int time_otp = 0;
  int statuscode = 404;

  var domain = new ApiRequestDatabases();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LoadingSuccess(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (statuscode == 200) {
            return OTPRegister(otp, time_otp);
          } else if (statuscode == 404) {
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
                              Lottie.asset("assets/animation/error02.json"),
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
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SelectScreens()),
                                );
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
        }
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 0, 0, 0),
              child: SafeArea(
                child: Column(
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
        );
      },
    );
  }

  Future LoadingSuccess() async {
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Register/Register.php?UserPlatform=${Platform}&UserStstus=${status}&UserEmail=${Email}&Username=${Username}&UserPassword=${Password}&c_password=${CheckPass}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);

      if (response.statusCode == 200) {
        otp = json_res["message"]['OTP'];
        time_otp = json_res["message"]["Time_OTP"];
        statuscode = json_res["StatusCode"];
      } else if (response.statusCode == 404) {
        statuscode = json_res["StatusCode"];
        message = json_res["Status"];
        print(json_res['Status']);
        print(statuscode);
      }
    } catch (err) {
      print(err);
    }
  }
}
