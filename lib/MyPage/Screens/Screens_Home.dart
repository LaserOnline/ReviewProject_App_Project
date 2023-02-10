import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../Widget/MyFlexiableAppBar/MyFlexiableAppBar.dart';
import '../../models/Connect_Failed/Connect_Failed.dart';
import '../../models/Variable/Variable.dart';
import '../../Widget/Drawer/Drawer.dart';
import '../../models/Dimensions/Models_Dimensions.dart';
import '../../models/Loading/Loading.dart';
import '../../Widget/HomeScreens/NewContent.dart';
import '../../Widget/HomeScreens/North.dart';
import '../../Widget/HomeScreens/Northeast.dart';
import '../../Widget/HomeScreens/West.dart';
import '../../Widget/HomeScreens/Central.dart';
import '../../Widget/HomeScreens/Eastern.dart';
import '../../Widget/HomeScreens/South.dart';

class Screens_Home extends StatefulWidget {
  @override
  State<Screens_Home> createState() => _Screens_Home();
}

class _Screens_Home extends State<Screens_Home> {
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
                    body: DefaultTabController(
                      length: ItemsTabs.tabs.length,
                      child: Scaffold(
                        drawer: DrawerMenu(),
                        body: NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return [
                              SliverOverlapAbsorber(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                                sliver: SliverAppBar(
                                  leading: Builder(
                                    builder: (context) => IconButton(
                                      icon: Icon(
                                        Icons.menu,
                                        size: 30,
                                        color: Color.fromARGB(255, 14, 14, 13),
                                      ),
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                    ),
                                  ),
                                  title: AutoSizeText(
                                    '${Text_Title.Title}',
                                    style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  centerTitle: true,
                                  backgroundColor:Color(0xFF1F5BF6),
                                  elevation: 0,
                                  pinned: true,
                                  expandedHeight: Dimensions.M_SizeBoxMenu,
                                  forceElevated: innerBoxIsScrolled,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: MyFlexiableAppBar(),
                                  ),
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
                                      child: TabBar(
                                        isScrollable: true,
                                        indicator: BoxDecoration(),
                                        labelColor: Colors.black,
                                        labelStyle: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        unselectedLabelColor: Color(0xFF424242),
                                        unselectedLabelStyle: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        tabs: ItemsTabs.tabs
                                            .map((String name) =>
                                                Tab(text: name))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                          body: TabBarView(
                            children: [
                              // ! รออัพเดท
                              NewContent(),
                              North(),
                              Northeast(),
                              West(),
                              Central(),
                              Eastern(),
                              South(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  // ! Table
                  return Scaffold(
                    body: DefaultTabController(
                      length: ItemsTabs.tabs.length,
                      child: Scaffold(
                        drawer: DrawerMenu(),
                        body: NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return [
                              SliverOverlapAbsorber(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                                sliver: SliverAppBar(
                                  leading: Builder(
                                    builder: (context) => IconButton(
                                      icon: Icon(
                                        Icons.menu,
                                        size: Dimensions.S_Icons_Menu,
                                        color:
                                            Color.fromARGB(255, 255, 252, 252),
                                      ),
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                    ),
                                  ),
                                  title: Container(
                                    child: AutoSizeText(
                                      '${Text_Title.Title}',
                                      style: GoogleFonts.kanit(
                                        textStyle: TextStyle(
                                          fontSize: Dimensions.S_SizeTitle,
                                          color: Color.fromARGB(
                                              209, 255, 255, 255),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  centerTitle: true,
                                  backgroundColor: Color(0xFF1F5BF6),
                                  elevation: 0,
                                  pinned: true,
                                  expandedHeight: Dimensions.S_SizeBoxMenu,
                                  forceElevated: innerBoxIsScrolled,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: MyFlexiableAppBar(),
                                  ),
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
                                      child: TabBar(
                                        isScrollable: true,
                                        indicator: BoxDecoration(),
                                        labelColor: Colors.black,
                                        labelStyle: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        unselectedLabelColor: Color(0xFF424242),
                                        unselectedLabelStyle: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        tabs: ItemsTabs.tabs
                                            .map((String name) =>
                                                Tab(text: name))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                          body: TabBarView(
                            children: [
                              NewContent(),
                              North(),
                              Northeast(),
                              West(),
                              Central(),
                              Eastern(),
                              South(),
                            ],
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
