import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Connect_Failed extends StatefulWidget {
  const Connect_Failed({Key? key}) : super(key: key);

  @override
  State<Connect_Failed> createState() => _Connect_Failed();
}

class _Connect_Failed extends State<Connect_Failed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  AutoSizeText(
                    "Connect Server Failed",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 4,
                  ),
                  AutoSizeText(
                    "ขออภัยในความไม่สะดวก เราไม่สามารถเปิดเซิฟให้ได้ตลอด 24 ชั่วโมงได้ เนื่องจากเจ้าของเซิฟ มันก็ต้องเอาเครื่องไปเรียนไปใช้ ด้วย ไม่มีงบ ซื้อเครื่อง Server ขออภัยอย่างสูง",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Lottie.asset("assets/animation/server.json"),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                "Plase Call James",
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
