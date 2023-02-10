import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuGuide extends StatelessWidget {
  const MenuGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Color.fromARGB(255, 31, 29, 32),
          child: InkWell(
            child: Icon(Icons.fmd_good_rounded,
                size: 50, color: Color.fromARGB(255, 238, 1, 1)),
            onTap: () {
              print("MenuGuide");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CreateContent()),
              // );
            },
          ),
        ),
        Text(
          "ไกด์",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
