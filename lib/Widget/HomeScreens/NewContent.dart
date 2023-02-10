import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/Loading/Loading.dart';
import '../../models/Variable/Variable.dart';
import '../../api/RequestDatabases.dart';
import './Detail/Detail.dart';

class NewContent extends StatefulWidget {
  const NewContent({Key? key}) : super(key: key);

  @override
  State<NewContent> createState() => _NewContent();
}

class _NewContent extends State<NewContent> {
  var domain = new ApiRequestDatabases();
  var api_content = new Content();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api_content.LoadContent(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Container(
              // color: Colors.red,
              child: Padding(
                // ช่องว่างระหว่างขอบ
                padding: const EdgeInsets.only(
                  top: 104,
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 300, //ขนาดกล่องสีเหลือง
                  ),
                  itemCount: api_content.index,
                  itemBuilder: (_, id) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                        color: Colors.amberAccent.shade200,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: InkWell(
                              child: Image.network(
                                "${api_content.image[id]}",
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Detail(api_content.primary_key[id])),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "${api_content.title[id]}",
                                  style: GoogleFonts.kanit(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 8, 8, 8),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                AutoSizeText(
                                  "${api_content.detail[id]}",
                                  style: GoogleFonts.kanit(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  maxLines: 1,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        'assets/images/comments.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Container(
                                      width: 25,
                                      child: AutoSizeText(
                                        "${api_content.comment[id]}",
                                        style: GoogleFonts.kanit(
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        minFontSize: 12,
                                        maxLines: 1,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        'assets/images/like01.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Container(
                                      width: 25,
                                      child: AutoSizeText(
                                        "${api_content.like[id]}",
                                        style: GoogleFonts.kanit(
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        minFontSize: 12,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Loading();
      },
    );
  }
}
