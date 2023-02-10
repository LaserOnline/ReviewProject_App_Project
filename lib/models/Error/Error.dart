import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Error extends StatefulWidget {
  const Error({Key? key}) : super(key: key);

  @override
  State<Error> createState() => _Error();
}

class _Error extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Lottie.asset("assets/animation/Status_Error.json"),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                "Status ล้มเหลว",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
