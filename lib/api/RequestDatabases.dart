import 'dart:math';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRequestDatabases {
  final String domain = "https://debian-server-apache2.laseronline.uk/";
  bool StatusConnect = false;
  int StatusCode = 0;
  Future RequestConnect() async {
    var url =
        Uri.parse('${domain}Apache/Api_Rbac_Final/Models/Connect/Connect.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var Request = json.decode(response.body);
      StatusConnect = Request['ConnectSuccess'];
      StatusCode = Request['StatusCode'];
      return StatusConnect;
    }
  }
}

class UserLogout {
  var domain = new ApiRequestDatabases();
  Future Logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }
}

class TimeOTP {
  var domain = new ApiRequestDatabases();

  Future DeleteSelectOTP(final String otp) async {
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Models/OTP/Time/Register/Time.php?otp=${otp}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var Request = json.decode(response.body);
        print(Request);
      }
    } catch (err) {
      print(err);
    }
  }
}

class ApiSendOTP {
  var domain = new ApiRequestDatabases();
  String? status;
  int? statuscode;
  Future SendOTP(final String pin1, final String pin2, final String pin3,
      final String pin4) async {
    try {
      final String otp = pin1 + pin2 + pin3 + pin4;
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Register/Success/Register.php?otp=${otp}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var Request = json.decode(response.body);
        status = Request["Status"];
        statuscode = Request["StatusCode"];
      }
    } catch (err) {
      print(err);
    }
  }
}

class RequestLogin {
  var domain = new ApiRequestDatabases();
  int statuscode = 0;
  Login(final String Email, String Password) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/User/Login/Login.php?UserEmail=${Email}&UserPassword=${Password}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json_res = json.decode(response.body);
        sp.setBool("isLogin", true);
        sp.setInt("Primary_Key", json_res["User"]["Primary_Key"]);
        sp.setString("UserKey", json_res['User']['UserKey']);
        sp.setString("UserPlatform", json_res['User']['UserPlatform']);
        sp.setString("UserStstus", json_res['User']['UserStstus']);
        sp.setString("UserEmail", json_res['User']['UserEmail']);
        sp.setString("Username", json_res['User']['Username']);
        sp.setString("FirstName", json_res['User']['FirstName']);
        sp.setString("LastName", json_res['User']['LastName']);
        sp.setString("Address", json_res['User']['Address']);
        sp.setString("UserProfile", json_res['User']['UserProfile']);
        sp.setInt("MoneyCoin", json_res['User']['MoneyCoin']);
      }
    } catch (err) {
      print(err);
    }
  }
}

class Content {
  var domain = new ApiRequestDatabases();
  int index = 0;
  List primary_key = [];
  List content_key = [];
  List image = [];
  List user_key = [];
  List title = [];
  List detail = [];
  List region = [];
  List like = [];
  List comment = [];
  List time = [];
  int statuscode = 404;
  Future LoadContent() async {
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Content/SelectAll/Select.php');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      statuscode = json_res["StatusCode"];
      if (statuscode == 200) {
        index = json_res["Index"];

        for (var i = 0; index >= i;) {
          primary_key.add(json_res["Data"][i]["Primary_Key"]);
          content_key.add(json_res["Data"][i]["Content_Key"]);
          user_key.add(json_res["Data"][i]["UserKey"]);
          title.add(json_res["Data"][i]["Content_Title"]);
          detail.add(json_res["Data"][i]["Content_Detail"]);
          like.add(json_res["Data"][i]["Content_Like"]);
          comment.add(json_res["Data"][i]["Comment"]);
          region.add(json_res["Data"][i]["Content_Region"]);

          image.add(
              "${domain.domain}Apache/Api_Rbac_Final/Upload/Content/Cover/${json_res["Data"][i]["Image"]}");
          time.add(json_res["Data"][i]["Time"]);

          i++;
        }
      }
    } catch (err) {
      print(err);
    }
  }

  Future LoadRegion(String Region) async {
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Content/Content_Region/Content_Region.php?Region=${Region}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      statuscode = json_res["StatusCode"];
      if (statuscode == 200) {
        index = json_res["Index"];

        for (var i = 0; index >= i;) {
          primary_key.add(json_res["Data"][i]["Primary_Key"]);
          content_key.add(json_res["Data"][i]["Content_Key"]);
          user_key.add(json_res["Data"][i]["UserKey"]);
          title.add(json_res["Data"][i]["Content_Title"]);
          detail.add(json_res["Data"][i]["Content_Detail"]);
          like.add(json_res["Data"][i]["Content_Like"]);
          comment.add(json_res["Data"][i]["Comment"]);
          region.add(json_res["Data"][i]["Content_Region"]);
          image.add(
              "${domain.domain}Apache/Api_Rbac_Final/Upload/Content/Cover/${json_res["Data"][i]["Image"]}");
          time.add(json_res["Data"][i]["Time"]);

          i++;
        }
      }
    } catch (err) {
      print(err);
    }
  }
}

class Select_Comment {
  var domain = new ApiRequestDatabases();
  List id = [];
  List username = [];
  List userkey = [];
  List user_profile = [];
  List user_platform = [];
  List comment = [];
  List create_time = [];
  int index_comment = 0;
  int StatucCode = 404;
  Future List_Comment(String Content_Key) async {
    try {
      var url = Uri.parse(
          '${domain.domain}Apache/Api_Rbac_Final/Content/Select_Comment/Select_Comment.php?Content_Key=${Content_Key}');
      var response = await http.get(url);
      var json_res = json.decode(response.body);
      StatucCode = json_res["StatusCode"];
      index_comment = json_res["Index"];
      if (StatucCode == 200) {
        for (var i = 0; index_comment >= i;) {
          id.add(json_res["Data"][i]["ID"]);
          userkey.add(json_res["Data"][i]["UserKey"]);
          username.add(json_res["Data"][i]["Username"]);
          user_profile.add(json_res["Data"][i]["UserProfile"]);
          comment.add(json_res["Data"][i]["Comment"]);
          user_platform.add(json_res["Data"][i]["UserPlatform"]);
          create_time.add(json_res["Data"][i]["create_time"]);
          i++;
        }
      }
    } catch (err) {
      print(err);
    }
  }
}

class APIGoogleSignln {
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googleSignin.signIn();
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }
}
