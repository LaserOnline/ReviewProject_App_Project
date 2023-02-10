import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class moreDetailRes extends StatefulWidget {
  const moreDetailRes({super.key});

  @override
  State<moreDetailRes> createState() => _moreDetailResState();
}

class _moreDetailResState extends State<moreDetailRes> {
  // Title List Here
  var titleList = [
    "ชุดหมูเซ็ต 299 บาท",
    "ชุดหมูเซ็ต 399 บาท",
    "ชุดเนื้อเซ็ต 499 บาท",
    "ชุดเนื้อเซ็ต 599 บาท",
  ];

  // Description List Here
  var descList = [
    "ชุดหมูสุดคุ้ม + บุฟเฟ่ต์ผัก",
    "ชุดหมูสุดคุ้ม + บุฟเฟ่ต์ผัก + รีฟิวน้ำ",
    "ชุดเนื้อสุดคุ้ม + บุฟเฟ่ต์ผัก",
    "ชุดเนื้อสุดคุ้ม + บุฟเฟ่ต์ผัก + รีฟิวน้ำ",
  ];

  // Image Name List Here
  var urlImages = [
    "https://i.pinimg.com/originals/58/2d/96/582d96a1df2d94bb439af1594639ccfe.jpg",
    "https://marmotamaps.com/de/fx/wallpaper/download/faszinationen/Marmotamaps_Wallpaper_Berchtesgaden_Desktop_1920x1080.jpg",
    "https://i.pinimg.com/originals/8b/38/89/8b388987a365d4fd55dbf6adeae81ca7.jpg",
    "https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-thumb.jpg",
  ];

  // Price List Here
  var prices = [
    "฿299",
    "฿399",
    "฿499",
    "฿599",
  ];

  // Price Sale List Here
  var pricesSale = [
    "฿399",
    "฿499",
    "฿599",
    "฿699",
  ];
  
  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Recommend',
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              // fontSize: 24,
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: ListView.builder(
        itemCount: urlImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, urlImages[index], titleList[index], descList[index], prices[index], pricesSale[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      urlImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Row(
                            children: [
                              Text(
                                prices[index],
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFFF2020),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                pricesSale[index],
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc, price, psale) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 380,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500],),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        price,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFFF2020),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        psale,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[500],
                          decoration: TextDecoration.lineThrough,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
