import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../models/Variable/Variable.dart';
import '../../../../api/RequestDatabases.dart';
import '../../../../MyPage/SelectScreens.dart';

class OTPRegister extends StatefulWidget {
  OTPRegister(String otp, int time_otp) {
    this.otp = otp;
    this.time_otp = time_otp;
  }

  String otp = "";
  int time_otp = 0;
  @override
  State<OTPRegister> createState() {
    return _OTPRegister(otp, time_otp);
  }
}

class _OTPRegister extends State<OTPRegister> {
  _OTPRegister(String otp, int time_otp) {
    this.otp = otp;
    this.time_otp = time_otp;
  }
  var Del = new TimeOTP();
  var Message = new Data_Variable();
  var Send = new ApiSendOTP();

  String otp = "";
  int time_otp = 0;
  Timer? timer;

  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();

  TimeSeconds() async {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (time_otp > 0) {
        setState(() => time_otp--);
      } else {
        timer?.cancel();
      }
    });
  }

  var domain = new ApiRequestDatabases();
  @override
  void initState() {
    super.initState();
    TimeSeconds();
    CheckTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color.fromARGB(255, 82, 82, 216),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Lottie.asset("assets/animation/otp.json"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: pin1,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "${Message.OTPHintText}"),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: pin2,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "${Message.OTPHintText}"),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: pin3,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "${Message.OTPHintText}"),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: pin4,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "${Message.OTPHintText}"),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 5.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 243, 222, 154),
                    ),
                    height: 60,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: SendOTP,
                          child: AutoSizeText(
                            "${time_otp}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 29, 1, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SendOTP() async {
    try {
      final String sumotp = pin1.text + pin2.text + pin3.text + pin4.text;
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Register/Success/Register.php?otp=${sumotp}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SelectScreens()),
          (Route<dynamic> route) => false,
        );
      }
      print("${sumotp}");
    } catch (err) {
      print(err);
    }
  }

  Future CheckTime() async {
    String status = "";
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Models/OTP/Time/Register/Time.php?otp=${otp}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      if (response.statusCode == 200) {
        status = json_res["Status"];
        if (status == "TimeOut") {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => SelectScreens()),
            (Route<dynamic> route) => false,
          );
        }
      }
    } catch (err) {
      print(err);
    }
  }
}
