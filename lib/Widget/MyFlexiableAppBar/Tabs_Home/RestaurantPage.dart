import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/RequestDatabases.dart';
import '../../../models/Dimensions/Models_Dimensions.dart';
import '../../../models/Loading/Loading.dart';
import '../../../models/Variable/Variable.dart';
import '../../DetailRes/DetailRes.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  var domain = new ApiRequestDatabases();
  var api_content = new Content();
  int index = 0;

  var Item = new ButtonType();
  var ItemHit = new ButtonHit();

  String dropdownValue = 'ประเภท';
  String dropdownValueHit = 'สถานที่ยอดนิยม';

  var Dimensions = new Models_Dimensions();
  var ItemsTabs = new Item_Tabs_Home();
  var Text_Title = new Data_Variable();

  TabBar get _tabBar => TabBar(
        tabs: [],
      );

  // * รอฟังชั่นต่อ databases
  Future Setup() async {}
// * รอฟังชั่นต่อ databases
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Setup(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // * รอฟังชั่นต่อ databases
          if (true)
            // * รอฟังชั่นต่อ databases
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < mobileWidth) {
                  return Scaffold(
                    body: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                            sliver: SliverAppBar(
                              leading: Builder(
                                builder: (context) => IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.pop(
                                    context,
                                  ),
                                ),
                              ),
                              title: AutoSizeText(
                                '${Text_Title.RestaurantTitle}',
                              ),
                              centerTitle: true,
                              backgroundColor: Color(0xFF1F5BF6),
                              elevation: 0,
                              pinned: true,
                              // expandedHeight: Dimensions.M_SizeBoxMenu,
                              forceElevated: innerBoxIsScrolled,
                              bottom: PreferredSize(
                                preferredSize: _tabBar.preferredSize,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DropdownButton(
                                        value: dropdownValue,
                                        icon: Icon(
                                          Icons.expand_more_rounded,
                                          color: Colors.black,
                                        ),
                                        items: Item.type.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(items),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                      ),
                                      DropdownButton(
                                        value: dropdownValueHit,
                                        icon: Icon(
                                          Icons.expand_more_rounded,
                                          color: Colors.black,
                                        ),
                                        items: ItemHit.hit.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(items),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValueHit = newValue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ];
                      },
                      body: Container(
                        // color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 104,
                            left: 15,
                            right: 15,
                          ),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                              mainAxisExtent: 370, //ขนาดกล่องสีเหลือง
                            ),
                            // itemCount: api_content.index,
                            itemCount: 1,
                            itemBuilder: (_, id) {
                              return Container(
                                // margin: EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailRes()),
                                    );
                                  },
                                  child: ClipRRect(
                                    child: Banner(
                                      message: "Top 3",
                                      location: BannerLocation.topStart,
                                      color: Colors.red,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.amberAccent.shade200,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                  child: Image.network(
                                                    'https://i.pinimg.com/originals/58/2d/96/582d96a1df2d94bb439af1594639ccfe.jpg',
                                                    width: double.infinity,
                                                    height: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Text(
                                                        '-50%',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      "จิ้มจุ่มซีฟูดส์",
                                                      style: GoogleFonts.kanit(
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
                                                              255, 8, 8, 8),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      maxLines: 2,
                                                      minFontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 5,
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  const SizedBox(
                                                    width: 8.0,
                                                  ),
                                                  AutoSizeText(
                                                    "5 ดาว",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 30,
                                                    color: Colors.red,
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  AutoSizeText(
                                                    "พัทยา",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                // top: 15,
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  AutoSizeText(
                                                    "THB 319",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFFFF2020),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                  const SizedBox(
                                                    width: 8.0,
                                                  ),
                                                  AutoSizeText(
                                                    "THB 419",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xFF424242),
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    body: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                            sliver: SliverAppBar(
                              leading: Builder(
                                builder: (context) => IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.pop(
                                    context,
                                  ),
                                ),
                              ),
                              title: AutoSizeText(
                                '${Text_Title.RestaurantTitle}',
                              ),
                              centerTitle: true,
                              backgroundColor: Color(0xFF1F5BF6),
                              elevation: 0,
                              pinned: true,
                              // expandedHeight: Dimensions.M_SizeBoxMenu,
                              forceElevated: innerBoxIsScrolled,
                              bottom: PreferredSize(
                                preferredSize: _tabBar.preferredSize,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DropdownButton(
                                        value: dropdownValue,
                                        icon: Icon(
                                          Icons.expand_more_rounded,
                                          color: Colors.black,
                                        ),
                                        items: Item.type.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(items),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                      ),
                                      DropdownButton(
                                        value: dropdownValueHit,
                                        icon: Icon(
                                          Icons.expand_more_rounded,
                                          color: Colors.black,
                                        ),
                                        items: ItemHit.hit.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(items),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValueHit = newValue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ];
                      },
                      body: Container(
                        // color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 104,
                            left: 15,
                            right: 15,
                          ),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                              mainAxisExtent: 370, //ขนาดกล่องสีเหลือง
                            ),
                            // itemCount: api_content.index,
                            itemCount: 1,
                            itemBuilder: (_, id) {
                              return Container(
                                // margin: EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailRes()),
                                    );
                                  },
                                  child: ClipRRect(
                                    child: Banner(
                                      message: "Top 3",
                                      location: BannerLocation.topStart,
                                      color: Colors.red,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.amberAccent.shade200,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                  child: Image.network(
                                                    'https://i.pinimg.com/originals/58/2d/96/582d96a1df2d94bb439af1594639ccfe.jpg',
                                                    width: double.infinity,
                                                    height: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Text(
                                                        '-50%',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      "จิ้มจุ่มซีฟูดส์",
                                                      style: GoogleFonts.kanit(
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
                                                              255, 8, 8, 8),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      maxLines: 2,
                                                      minFontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 5,
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 20,
                                                    color: Color(0xFFFD8E28),
                                                  ),
                                                  const SizedBox(
                                                    width: 8.0,
                                                  ),
                                                  AutoSizeText(
                                                    "5 ดาว",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 30,
                                                    color: Colors.red,
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  AutoSizeText(
                                                    "พัทยา",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                // top: 15,
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Row(
                                                children: [
                                                  AutoSizeText(
                                                    "THB 319",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFFFF2020),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                  const SizedBox(
                                                    width: 8.0,
                                                  ),
                                                  AutoSizeText(
                                                    "THB 419",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xFF424242),
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
        }
        return Loading();
      },
    );
  }
}
