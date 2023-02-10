import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../CreateContent/CreateContent.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Color.fromARGB(255, 31, 29, 32),
          child: InkWell(
            child: Icon(Icons.chat_rounded,
                size: 50, color: Color.fromARGB(255, 255, 0, 0)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateContent()),
              );
            },
          ),
        ),
        Text(
          "โพสต์",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
