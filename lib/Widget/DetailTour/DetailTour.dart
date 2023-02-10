import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/Loading/Loading.dart';
import 'moreDetailTour.dart';

class DetailTour extends StatefulWidget {
  const DetailTour({super.key});

  @override
  State<DetailTour> createState() => _DetailTourState();
}

class _DetailTourState extends State<DetailTour> {
  int id = 0;
  final urlImages = [
    "https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-thumb.jpg",
    "https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg?w=2000",
    "https://cdnb.artstation.com/p/assets/video_clips/images/024/538/805/large/pixel-jeff-thumb.jpg?1582740711",
  ];

  // * รอฟังชั่นต่อ databases
  Future Setup() async {}
// * รอฟังชั่นต่อ databases
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Setup(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                'รายละเอียด',
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
            body: Column(
              children: [
                Container(
                  // color: Colors.amber,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 8,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFE396E4),
                                    radius: 20,
                                    child: Icon(
                                      Icons.library_books_rounded,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: AutoSizeText(
                                      "ทัวร์ไทยกัน",
                                      style: GoogleFonts.kanit(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color.fromARGB(255, 7, 7, 7),
                                        ),
                                      ),
                                      minFontSize: 12,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5, //แนวตั้ง
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF99C9EC),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: Color(0xFFF5F5F5),
                                        child: InkWell(
                                          splashColor: Colors.pink,
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 35,
                                            height: 35,
                                            child: Icon(
                                              Icons.favorite_border_rounded,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      'ชื่นชอบ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5, //แนวตั้ง
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEBCA74),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: Color(0xFFF5F5F5),
                                        child: InkWell(
                                          splashColor: Color(0xFF99C9EC),
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 35,
                                            height: 35,
                                            child: Icon(
                                              Icons.calendar_month_rounded,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      'เพิ่มทริป',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 15,
                            ),
                            child: Container(
                              child: CarouselSlider.builder(
                                // itemCount: urlImages.length,
                                itemCount: 3,
                                itemBuilder: (context, index, realIndex) {
                                  final urlImage = urlImages[index];
                                  return buildImage(urlImage, index, id);
                                },
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  height: 240,
                                  autoPlay: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  // reverse: true,
                                  autoPlayInterval: Duration(seconds: 4),
                                ),
                              ),
                            ),
                          ),
                          // * Title
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                                left: 15,
                                right: 15,
                              ),
                              child: AutoSizeText(
                                "ทัวร์ไทยกัน",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 19, 19, 19),
                                  ),
                                ),
                                minFontSize: 12,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          // * Title
                          // * Detail
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 15,
                              right: 15,
                              bottom: 8,
                            ),
                            child: Container(
                              child: AutoSizeText(
                                "ข้อมูลทัวร์",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 19, 19, 19),
                                  ),
                                ),
                                maxLines: 15,
                              ),
                            ),
                          ),
                          // * Detail
                          Divider(
                            color: Color.fromARGB(255, 144, 141, 141),
                            height: 2,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    "Recommended",
                                    style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 19, 19, 19),
                                      ),
                                    ),
                                    minFontSize: 12,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Color(0xFFD9D9D9),
                                      child: InkWell(
                                        splashColor: Colors.black,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    moreDetailTour()),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: Icon(
                                            Icons.list_rounded,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    bottom: 15,
                                  ),
                                  // padding: EdgeInsets.symmetric(
                                  //   vertical: 5, //แนวตั้ง
                                  //   horizontal: 30,
                                  // ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF99C9EC),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    'https://i.pinimg.com/originals/58/2d/96/582d96a1df2d94bb439af1594639ccfe.jpg',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    bottom: 15,
                                  ),
                                  // padding: EdgeInsets.symmetric(
                                  //   vertical: 5, //แนวตั้ง
                                  //   horizontal: 30,
                                  // ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEBCA74),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    'https://marmotamaps.com/de/fx/wallpaper/download/faszinationen/Marmotamaps_Wallpaper_Berchtesgaden_Desktop_1920x1080.jpg',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    bottom: 15,
                                  ),
                                  // padding: EdgeInsets.symmetric(
                                  //   vertical: 5, //แนวตั้ง
                                  //   horizontal: 30,
                                  // ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF99C9EC),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    'https://i.pinimg.com/originals/8b/38/89/8b388987a365d4fd55dbf6adeae81ca7.jpg',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    right: 10,
                                    bottom: 15,
                                  ),
                                  // padding: EdgeInsets.symmetric(
                                  //   vertical: 5, //แนวตั้ง
                                  //   horizontal: 30,
                                  // ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEBCA74),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-thumb.jpg',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 144, 141, 141),
                            height: 2,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                                left: 15,
                                right: 15,
                              ),
                              child: AutoSizeText(
                                "โลเคชัน",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 19, 19, 19),
                                  ),
                                ),
                                minFontSize: 12,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          // * Title
                          // * Detail
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 15,
                              right: 15,
                              bottom: 8,
                            ),
                            child: Container(
                              child: InkWell(
                                onTap: () {},
                                child: AutoSizeText(
                                  "กดแล้วไปหน้าแมพ",
                                  style: GoogleFonts.kanit(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 19, 19, 19),
                                    ),
                                  ),
                                  maxLines: 15,
                                ),
                              ),
                            ),
                          ),
                          // * Detail
                          Divider(
                            color: Color.fromARGB(255, 144, 141, 141),
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Loading();
      },
    );
  }

  Widget buildImage(String urlImage, int index, int id) => Container(
        color: Colors.grey,
        child: InkWell(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
            width: 400,
          ),
          onTap: () {},
        ),
      );
}
