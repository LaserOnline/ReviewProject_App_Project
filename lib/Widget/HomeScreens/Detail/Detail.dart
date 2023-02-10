import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lottie/lottie.dart';
import '../../../api/RequestDatabases.dart';
import '../../../models/Loading/Loading.dart';
import '../../../Widget/SingIn/SingIn.dart';

class Detail extends StatefulWidget {
  Detail(int id) {
    this.id = id;
  }
  int id = 0;
  @override
  State<Detail> createState() {
    return _Detail(id);
  }
}

class _Detail extends State<Detail> {
  _Detail(int id) {
    this.id = id;
  }
  var domain = new ApiRequestDatabases();
  var select = new Select_Comment();
  bool isLogin = false;
  int id = 0;
  int index = 0;
  int StatusCode = 404;
  int activeIndex = 0;
  final urlImages = [];
  String title = "";
  String detail = "";
  String create_time = "";
  String content_myProfile = "";
  String content_myUsername = "";
  int Content_Like = 0;
  String like = "";
  String? UserKey;
  String? UserProfile;
  String? UserPlatform;
  String Content_Key = "";
  TextEditingController SendComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SetUp(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Color.fromARGB(255, 247, 244, 244),
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
                    color: Color.fromARGB(255, 252, 250, 250),
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ),
            body: Column(
              children: [
                Container(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // * My Content User
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                          "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/${content_myProfile}"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: AutoSizeText(
                                        "${content_myUsername}",
                                        style: GoogleFonts.kanit(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color.fromARGB(255, 7, 7, 7),
                                          ),
                                        ),
                                        minFontSize: 12,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: AutoSizeText(
                                        "${create_time}",
                                        style: GoogleFonts.kanit(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 7, 7, 7),
                                          ),
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // * My Content User
                          // * Images
                          Container(
                            child: CarouselSlider.builder(
                              itemCount: urlImages.length,
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
                                autoPlayInterval: Duration(seconds: 2),
                              ),
                            ),
                          ),
                          // * Images
                          // * Title
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                "${title}",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
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
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: AutoSizeText(
                                "${detail}",
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
                          FutureBuilder(
                            future: select.List_Comment(Content_Key),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return // * คอมเมนต์
                                    Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                            'assets/images/chat_01.png',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: AutoSizeText(
                                            "${select.index_comment}",
                                            style: GoogleFonts.kanit(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 7, 7, 7),
                                              ),
                                            ),
                                            minFontSize: 15,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                            'assets/images/like.png',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: AutoSizeText(
                                            "${Content_Like}",
                                            style: GoogleFonts.kanit(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 7, 7, 7),
                                              ),
                                            ),
                                            minFontSize: 15,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                                // * คอมเมนต์
                              }
                              return LinearProgressIndicator();
                            },
                          ),
                          FutureBuilder(
                            future: select.List_Comment(Content_Key),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (select.index_comment != 0) {
                                  return Column(
                                    children: [
                                      Container(
                                        child: GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            crossAxisSpacing: 12.0,
                                            mainAxisSpacing: 12.0,
                                            mainAxisExtent: 200,
                                          ),
                                          itemCount: select.index_comment,
                                          itemBuilder: (_, id) {
                                            return Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // * Image From Google
                                                      Visibility(
                                                        visible:
                                                            select.user_platform[
                                                                    id] ==
                                                                "ByGoogle",
                                                        child: Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: CircleAvatar(
                                                              radius: 25,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      "${select.user_profile[id]}"),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // * Image From Google
                                                      // * Image From Email
                                                      Visibility(
                                                        visible:
                                                            select.user_platform[
                                                                    id] ==
                                                                "ByEmail",
                                                        child: Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: CircleAvatar(
                                                              radius: 25,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/${select.user_profile[id]}"),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // * Image From Email
                                                      Container(
                                                        child: Expanded(
                                                          child: AutoSizeText(
                                                            "${select.username[id]}",
                                                            style: GoogleFonts
                                                                .kanit(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        7,
                                                                        7,
                                                                        7),
                                                              ),
                                                            ),
                                                            minFontSize: 12,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: AutoSizeText(
                                                            "${select.create_time[id]}",
                                                            style: GoogleFonts
                                                                .kanit(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 10,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        7,
                                                                        7,
                                                                        7),
                                                              ),
                                                            ),
                                                            minFontSize: 12,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      select.userkey[id] ==
                                                              UserKey
                                                          ? Container(
                                                              height: 50,
                                                              width: 50,
                                                              child: InkWell(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/remove_chat.png',
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  Delete(
                                                                      select.id[
                                                                          id],
                                                                      Content_Key);
                                                                },
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 50,
                                                              width: 50,
                                                              child: InkWell(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/comments.png',
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  //  * Event
                                                                },
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0,
                                                              right: 50.0),
                                                      child: AutoSizeText(
                                                        "${select.comment[id]}",
                                                        style:
                                                            GoogleFonts.kanit(
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    7,
                                                                    7),
                                                          ),
                                                        ),
                                                        minFontSize: 15,
                                                        maxLines: 5,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (select.index_comment == 0) {
                                  return Container(
                                      color: Color.fromARGB(248, 250, 249, 249),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Lottie.asset(
                                              "assets/animation/NO_comments01.json"),
                                        ),
                                      ));
                                }
                              }
                              return LinearProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                isLogin == true
                    ? FutureBuilder(
                        future: StatusLike(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Container(
                              color: Color.fromARGB(248, 2, 2, 2),
                              child: Row(
                                children: [
                                  UserPlatform == "ByEmail"
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: CircleAvatar(
                                              radius: 22,
                                              backgroundImage: NetworkImage(
                                                  "${domain.domain}Apache/Api_Rbac_Final/Upload/Profile/${UserProfile}"),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: CircleAvatar(
                                                radius: 22,
                                                backgroundImage: NetworkImage(
                                                    "$UserProfile")),
                                          ),
                                        ),
                                  Container(
                                    width: 230,
                                    child: TextFormField(
                                      controller: SendComment,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color.fromARGB(225, 240, 239, 239),
                                        filled: true,
                                        hintText: 'คุณคิดอะไรอยู่ ?',
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 8, 8, 8)),
                                      ),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          'assets/images/send_02.png',
                                        ),
                                      ),
                                      onTap: () {
                                        Send_Comment();
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: like == "Like"
                                            ? Image.asset(
                                                'assets/images/clear_like.png',
                                              )
                                            : Image.asset(
                                                'assets/images/like.png',
                                              ),
                                      ),
                                      onTap: () {
                                        Like();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return LinearProgressIndicator();
                        },
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 3.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 124, 115, 207),
                          ),
                          height: 50,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PageSingIn(),
                                    ),
                                  );
                                },
                                child: AutoSizeText(
                                  "Login",
                                  style: GoogleFonts.kanit(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              )
                            ],
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

  Future SetUp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLogin = sp.getBool("isLogin") ?? false;
    UserKey = sp.getString('UserKey') ?? "";
    UserPlatform = sp.getString('UserPlatform') ?? "";
    UserProfile = sp.getString('UserProfile') ?? "";
    var url = Uri.parse(
        '${domain.domain}Apache/Api_Rbac_Final/Content/Select_Detail/Select_Detail.php?Primary_Key=${id}');
    var response = await http.get(url);
    var json_res = json.decode(response.body);
    if (response.statusCode == 200) {
      index = json_res["Index"];
      title = json_res["Data"][0]["Content_Title"];
      detail = json_res["Data"][0]["Content_Detail"];
      Content_Key = json_res["Data"][0]["Content_Key"];
      content_myProfile = json_res["Data"][0]["UserProfile"];
      content_myUsername = json_res["Data"][0]["Username"];
      Content_Like = json_res["Data"][0]["Content_Like"];
      create_time = json_res["Data"][0]["Time"];
      for (var i = 0; index >= i;) {
        urlImages.add(
            "${domain.domain}Apache/Api_Rbac_Final/Upload/Content/Details/${json_res["Data"][i]["Content_image"]}");

        i++;
      }
    } else {
      print("error");
    }
  }

  Like() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'กรุณาตรวจสอบข้อมูล',
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromARGB(255, 7, 7, 7),
            ),
          ),
        ),
        content: Text(
          "คุณแน่ใจหรือไม่ ว่าถูกใจสิ่งนี้",
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 252, 1, 1),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/images/back.png',
                ),
              ),
              onTap: () {
                Navigator.pop(context, 'Cancel');
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 50,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/images/like.png',
                ),
              ),
              onTap: () async {
                var url = Uri.parse(
                    '${domain.domain}Apache/Api_Rbac_Final/Content/Like/Like.php?Content_Key=${Content_Key}&UserKey=${UserKey}');
                var response = await http.get(url);
                var json_res = json.decode(response.body);
                int statuscode = json_res["StatusCode"];
                if (statuscode == 200) {
                  setState(() {
                    Navigator.pop(context, 'Cancel');
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future Send_Comment() async {
    if (SendComment.text.isEmpty) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('กรุณาตรวจสอบข้อมูล'),
          content: Text("กรุณาใส่ข้อความก่อน"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Content/Comment/Comment.php?UserKey=${UserKey}&Content_Key=${Content_Key}&Comment=${SendComment.text}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      StatusCode = json_res["StatusCode"];
      if (StatusCode == 200) {
        setState(() {
          Navigator.pop(context, 'OK');
        });
      }
    }
  }

  Delete(int id, String Content_Key) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'กรุณาตรวจสอบข้อมูล',
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromARGB(255, 7, 7, 7),
            ),
          ),
        ),
        content: Text(
          "คุณแน่ใจหรือไม่ว่าจะลบข้อความ",
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 252, 1, 1),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(
              'Cancel',
              style: GoogleFonts.kanit(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 41, 124, 52),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              var url = Uri.parse(
                  '${domain.domain}Apache/Api_Rbac_Final/Content/Delete/Delete.php?ID=${id}&Content_Key=${Content_Key}');
              var response = await http.get(url);
              var json_res = json.decode(response.body);
              int statuscode = json_res["StatusCode"];
              if (statuscode == 200) {
                setState(() {
                  Navigator.pop(context, 'OK');
                });
              }
              setState(() {
                Navigator.pop(context, 'OK');
              });
            },
            child: Text(
              'OK',
              style: GoogleFonts.kanit(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 250, 3, 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future StatusLike() async {
    var url = Uri.parse(
        '${domain.domain}Apache/Api_Rbac_Final/Content/Status_Like/Status_Like.php?UserKey=${UserKey}&Content_Key=${Content_Key}');
    var response = await http.get(url);
    var json_res = json.decode(response.body);
    if (json_res["StatusCode"] == 200) {
      like = json_res["Status"];
    }
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
