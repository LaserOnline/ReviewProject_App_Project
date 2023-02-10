import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Advert extends StatefulWidget {
  Advert(int index) {
    this.index = index;
  }
  int index = 0;
  @override
  State<Advert> createState() {
    return _Advert(index);
  }
}

class _Advert extends State<Advert> {
  _Advert(int index) {
    this.index = index;
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${index}"),
      ),
    );
  }
}
