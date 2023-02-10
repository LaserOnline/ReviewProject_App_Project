import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './ScreensBar/ScreensBar.dart';
import '../../Api/RequestDatabases.dart';
import '../../Models/Dimensions/Models_Dimensions.dart';
import '../../Models/Variable/Variable.dart';
import './Login/Login.dart';
import './Register/Register.dart';

class PageSingIn extends StatefulWidget {
  const PageSingIn({Key? key}) : super(key: key);

  @override
  State<PageSingIn> createState() => _PageSingIn();
}

class _PageSingIn extends State<PageSingIn> {
  @override
  var Dimensions = new Models_Dimensions();
  var ItemsTabs = new ItemSingUp();
  TabBar get _tabBar => TabBar(
        tabs: [],
      );
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return Scaffold(
            body: DefaultTabController(
              length: ItemsTabs.tabs.length,
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          leading: Builder(
                            builder: (context) => IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 30,
                                color: Color.fromARGB(255, 252, 250, 250),
                              ),
                              onPressed: () => Navigator.pop(
                                context,
                              ),
                            ),
                          ),
                          centerTitle: true,
                          backgroundColor: Colors.white,
                          elevation: 0,
                          pinned: true,
                          expandedHeight: Dimensions.M_SizeBoxMenu,
                          forceElevated: innerBoxIsScrolled,
                          flexibleSpace: FlexibleSpaceBar(
                            background: ScreensBar(),
                          ),
                          bottom: PreferredSize(
                            preferredSize: _tabBar.preferredSize,
                            child: ColoredBox(
                              color: Colors.white,
                              child: TabBar(
                                isScrollable: true,
                                indicator: const BoxDecoration(),
                                labelColor: Colors.black,
                                labelStyle: GoogleFonts.kanit(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                unselectedLabelColor: const Color(0xFF424242),
                                unselectedLabelStyle: GoogleFonts.kanit(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                tabs: ItemsTabs.tabs
                                    .map((String name) => Tab(text: name))
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
                      Login(),
                      Register(),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("ยังไม่ได้ส่วนหน้าจอใหญ่"),
              ),
            ),
          );
        }
      },
    );
  }
}
