import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../api/RequestDatabases.dart';

class Test4 extends StatefulWidget {
  const Test4({Key? key}) : super(key: key);

  @override
  State<Test4> createState() => _Test4();
}

class _Test4 extends State<Test4> {
  DateTime date = DateTime.now();
  DateTime checking_today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              child: Text("${date.year}/${date.month}/${date.day}"),
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2100),
                );
                if (newDate == null) return;
                setState(() => date = newDate);
                Getdatetime();
              },
            ),
            InkWell(
              child: Text("Test"),
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Color.fromARGB(255, 0, 0, 0), // <-- SEE HERE
                          onPrimary: Color.fromARGB(
                              255, 255, 255, 255), // <-- SEE HERE
                          onSurface:
                              Color.fromARGB(255, 17, 0, 255), // <-- SEE HERE
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: Colors.red, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (newDate == null) return;
                setState(() => date = newDate);
                Getdatetime();
              },
            ),
          ],
        ),
      ),
    );
  }

  Getdatetime() async {
    String str_date_year = date.year.toString();
    String str_date_month = date.month.toString();
    String str_date_day = date.day.toString();
    String str_date = "${str_date_year}/${str_date_month}/${str_date_day}";
    print(str_date);
  }
}
