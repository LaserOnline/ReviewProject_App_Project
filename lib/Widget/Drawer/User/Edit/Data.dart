import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../api/RequestDatabases.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _Data();
}

class _Data extends State<Data> {
  var domain = new ApiRequestDatabases();
  String UserKey = "";
  TextEditingController UsernameController = TextEditingController();
  TextEditingController FnameController = TextEditingController();
  TextEditingController LnameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Setup(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              height: 480,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 252, 252, 252),
                    width: 5.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 2, 2, 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        controller: UsernameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 245, 247)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 236, 5, 5)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'Username',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                          prefixIcon: Icon(
                            Icons.account_box_sharp,
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        autofillHints: [AutofillHints.email],
                        style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        controller: FnameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 245, 247)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 236, 5, 5)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'ชื่อจริง',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                          prefixIcon: Icon(
                            Icons.account_box_sharp,
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        autofillHints: [AutofillHints.email],
                        style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        controller: LnameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 245, 247)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 236, 5, 5)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'นามสกุล',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                          prefixIcon: Icon(
                            Icons.account_box_sharp,
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        autofillHints: [AutofillHints.email],
                        style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        controller: PhoneController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 245, 247)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 236, 5, 5)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'เบอร์โทร',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        autofillHints: [AutofillHints.email],
                        style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        controller: AddressController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 245, 247)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 236, 5, 5)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'ที่อยู่',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                          prefixIcon: Icon(
                            Icons.local_activity_outlined,
                            color: Color.fromARGB(255, 3, 3, 3),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        autofillHints: [AutofillHints.email],
                        style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 238, 235, 235),
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 104, 207, 78),
                      ),
                      height: 40,
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Send();
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return LinearProgressIndicator();
      },
    );
  }

  Send() async {
    final sp = await SharedPreferences.getInstance();
    if (UsernameController.text.isNotEmpty) {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Edit/Username/Username.php?UserKey=${UserKey}&Username=${UsernameController.text}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);

      if (json_res["StatusCode"] == 200) {
        sp.remove("Username");
        sp.setString("Username", json_res["Status"]);
        print("Success");
        setState(() {});
      }
    }
    if (FnameController.text.isNotEmpty) {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Edit/Fname/Fname.php?UserKey=${UserKey}&FirstName=${FnameController.text}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      if (json_res["StatusCode"] == 200) {
        print("Success");
        setState(() {});
      }
    }

    if (LnameController.text.isNotEmpty) {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Edit/Lname/Lname.php?LastName=${LnameController.text}&UserKey=${UserKey}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);

      if (json_res["StatusCode"] == 200) {
        print("Success");
        setState(() {});
      }
    }

    if (PhoneController.text.isNotEmpty) {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Edit/Phone/Phone.php?UserPhone=${PhoneController.text}&UserKey=${UserKey}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      if (json_res["StatusCode"] == 200) {
        print("Success");
        setState(() {});
      }
    }

    if (AddressController.text.isNotEmpty) {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Edit/Address/Address.php?Address=${AddressController.text}&UserKey=${UserKey}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      if (json_res["StatusCode"] == 200) {
        setState(() {
          print("Success");
        });
      }
    }
  }

  Future Setup() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    UserKey = sp.getString('UserKey') ?? "";
  }
}
