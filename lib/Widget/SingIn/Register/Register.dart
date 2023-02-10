import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../MyPage/SelectScreens.dart';
import '../../../Models/Dimensions/Models_Dimensions.dart';
import '../../../Models/Variable/Variable.dart';
import '../../../models/Loading/OTP/Loading/Loading.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  var Item = new ButtonRegister();
  String dropdownvalue = 'Normal';

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController CheckPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 93, 87, 175),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 150,
                  alignment: Alignment.topCenter,
                ),
                Stack(
                  children: [
                    Lottie.asset("assets/animation/abstract06.json"),
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
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  fillColor: Color.fromARGB(206, 248, 248, 250),
                                  filled: true,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 3, 3, 3)),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 3, 3, 3),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: [AutofillHints.email],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 5, 5)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: UsernameController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(255, 2, 2, 2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(255, 2, 2, 2)),
                                  ),
                                  fillColor: Color.fromARGB(206, 248, 248, 250),
                                  filled: true,
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 8, 8, 8)),
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Color.fromARGB(255, 5, 5, 5),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                autofillHints: [AutofillHints.email],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
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
                                        color: Color.fromARGB(255, 7, 7, 7)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  fillColor: Color.fromARGB(206, 248, 248, 250),
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: [AutofillHints.password],
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: CheckPassController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(255, 10, 10, 10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(255, 12, 12, 12)),
                                  ),
                                  fillColor: Color.fromARGB(206, 248, 248, 250),
                                  filled: true,
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: [AutofillHints.password],
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 2, 2),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 238, 235, 235),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(255, 130, 226, 21),
                                    ),
                                    height: 40,
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              SendRegister();
                                            });
                                          },
                                          child: AutoSizeText(
                                            "Submit",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color:
                                                  Color.fromARGB(255, 29, 1, 1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 238, 235, 235),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(255, 130, 226, 21),
                                    ),
                                    height: 40,
                                    width: 100,
                                    child: DropdownButton(
                                      value: dropdownvalue,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: Item.items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(items),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
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

  SendRegister() async {
    try {
      final String Platform = "ByEmail";
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => Loading(
              dropdownvalue,
              Platform,
              EmailController.text,
              UsernameController.text,
              PasswordController.text,
              CheckPassController.text),
        ),
        (Route<dynamic> route) => false,
      );
    } catch (err) {
      print(err);
    }
  }
}
