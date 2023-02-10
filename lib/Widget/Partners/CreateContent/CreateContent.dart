import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/Variable/Variable.dart';
import '../../../Models/PartnersControl/PartnersControl.dart';
import '../../../models/Loading/Content/LoadContent.dart';
import '../../../api/RequestDatabases.dart';

class CreateContent extends StatefulWidget {
  const CreateContent({Key? key}) : super(key: key);

  @override
  State<CreateContent> createState() => _CreateContent();
}

class _CreateContent extends State<CreateContent> {
  var Item = new ItemRegion();
  String Region = "ไม่ระบุบ";
  final ImagePicker _picker = ImagePicker();
  File? image;
  List<XFile> imageFileList = [];
  String? UserKey;
  String content_key = "";
  String status = "";
  int? statuscode;

  var domain = new ApiRequestDatabases();
  final TextEditingController TitleController = TextEditingController();
  final TextEditingController DetailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Conenct();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'สร้าง โพสต์',
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              // fontSize: 24,
              color: Colors.black,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Lottie.asset("assets/animation/abstract01.json"),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 300,
                  child: TextFormField(
                    controller: TitleController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 12, 12, 12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      filled: true,
                      hintText: 'ชื่อโพสต์',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                      prefixIcon: Icon(
                        Icons.create_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    autofillHints: [AutofillHints.email],
                    style: GoogleFonts.kanit(
                      textStyle: const TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 19, 19, 19),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Column(
                  children: [
                    AutoSizeText(
                      "รูปภาพปก",
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 19, 19, 19),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    image != null
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: (() => pickImage(ImageSource.gallery)),
                                child: Center(
                                  child: Image.file(
                                    image!,
                                    width: 400,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: (() => pickImage(ImageSource.gallery)),
                                child: Center(
                                  child: Container(
                                    height: 150.0,
                                    width: 400.0,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 138, 137, 137),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'ไม่มีรูปภาพ กรุณากดเลือก',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
                  controller: DetailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 12, 12, 12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    filled: true,
                    hintText: 'รายเอียด',
                    hintStyle: GoogleFonts.kanit(
                      textStyle: const TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 19, 19, 19),
                      ),
                    ),
                  ),
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  autofillHints: [AutofillHints.email],
                  style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: OutlinedButton(
                      onPressed: () {
                        selectImages();
                      },
                      child: AutoSizeText(
                        "เลือกรูปภาพ รายละเอียด",
                        style: GoogleFonts.kanit(
                          textStyle: const TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 19, 19, 19),
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: imageFileList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(
                              File(imageFileList[index].path),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 4,
                              top: 4,
                              child: Container(
                                color: Color.fromARGB(129, 241, 240, 241),
                                child: IconButton(
                                  onPressed: () {
                                    imageFileList.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.red[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              image != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 238, 235, 235),
                                    width: 5.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 130, 226, 21),
                              ),
                              height: 55,
                              width: 220,
                              child: DropdownButton(
                                value: Region,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: Item.region.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(items),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    Region = newValue!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    width: 3.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 97, 236, 85),
                              ),
                              height: 50,
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Send(
                                          imageFileList,
                                          TitleController.text,
                                          DetailController.text,
                                          Region,
                                          UserKey,
                                          image!);
                                      setState(() {});
                                    },
                                    child: AutoSizeText(
                                      "Submit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 29, 1, 1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      )),
    );
  }

  Conenct() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    UserKey = sp.getString('UserKey') ?? "";
  }

  Send(List<XFile> listimage, String TitleController, String DetailController,
      String Region, UserKey, File image) async {
    if (listimage.isNotEmpty) {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Content/Create/Create.php');
      final request = http.MultipartRequest('POST', url);
      request.fields['UserKey'] = UserKey;
      request.fields['Region'] = Region;
      request.fields['Title'] = TitleController;
      request.fields['Detail'] = DetailController;
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final responseJson = json.decode(responseBody);
      status = responseJson["Status"];
      statuscode = responseJson["StatusCode"];

      if (statuscode == 200) {
        content_key = responseJson["Status"];
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  LoadContent(listimage, content_key)),
        );
      } else if (statuscode == 404) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('กรุณาตรวจสอบข้อมูล'),
            content: Text("${status}"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('กรุณาตรวจสอบข้อมูล'),
          content: Text("กรุณาเลือกรูปภาพ รายละเอียด"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void selectImages() async {
    final List<XFile>? selectedImages =
        await _picker.pickMultiImage(maxHeight: 720, maxWidth: 1280);
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    setState(() {});
  }

  Future pickImage(ImageSource source) async {
    try {
      var image = await ImagePicker()
          .pickImage(source: source, maxHeight: 720, maxWidth: 1280);
      if (image == null) return;
      var pic = await http.MultipartFile.fromPath("Image", image.path);

      setState(() {
        this.image = File(image.path);
      });
    } on PlatformException catch (e) {
      print("Filed to Pick Image $e");
    }
  }
}
