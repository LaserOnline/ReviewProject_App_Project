import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _Loading();
}

class _Loading extends State<Loading> {
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
              child: Lottie.asset("assets/animation/Status_Loading.json"),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                "Loading",
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
