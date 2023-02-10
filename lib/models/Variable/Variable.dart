import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Api/RequestDatabases.dart';

class Data_Variable {
  String Title = "T R A V E L T R I P";
  String Login_Error = "";
  String Register_Error = "มีข้อผิดพลาดกรุณาตรวจสอบอีกรอบ";
  String Bottom_Message_Error = "ตกลง";
  String OTPHintText = "";

  String HotelTitle = "โรงแรม";
  String RestaurantTitle = "ร้านอาหาร";
  String TourTitle = "ทัวร์";
  String GuideTitle = "ไกด์";
  String ShoppingTitle = "ช้อปปิ้ง";
  String RelaxTitle = "พักผ่อน";
  String SosTitle = "ฉุกเฉิน";
}

class Item_Tabs_Home {
  final List<String> tabs = <String>[
    'เปิดประสบการณ์ใหม่',
    'ภาคเหนือ',
    'ภาคตะวันออกเฉียงเหนือ',
    'ภาคตะวันตก',
    'ภาคกลาง',
    'ภาคตะวันออก',
    'ภาคใต้',
  ];
}

class Item_Tabs_Deal {
  final List<String> tabs = <String>[
    'โปรโมชั่นแนะนำ',
    'โรงแรม',
    'ร้านอาหาร',
    'ทัวร์',
    'ไกด์',
  ];
}

class ItemSingUp {
  final List<String> tabs = <String>[
    'Login',
    'Register',
  ];
}

class ButtonRegister {
  var items = [
    'Normal',
    'Partners',
  ];
}

class ItemRegion {
  var region = [
    'ไม่ระบุบ',
    'ภาคเหนือ',
    'ภาคตะวันออกเฉียงเหนือ',
    'ภาคตะวันตก',
    'ภาคกลาง',
    'ภาคตะวันออก',
    'ภาคใต้'
  ];
}

class ButtonType {
  var type = [
    'ประเภท',
    '1 ดาว',
    '2 ดาว',
    '3 ดาว',
    '4 ดาว',
    '5 ดาว',
  ];
}

class ButtonHit {
  var hit = [
    'สถานที่ยอดนิยม',
    'กรุงเทพฯ',
    'พัทยา',
    'ภูเก็ต',
  ];
}

class ButtonHitTour {
  var hit = [
    'ทัวร์ยอดนิยม',
    'กรุงเทพฯ',
    'พัทยา',
    'ภูเก็ต',
  ];
}

class ButtonHitGuide {
  var hit = [
    'ไกด์ยอดนิยม',
    'กรุงเทพฯ',
    'พัทยา',
    'ภูเก็ต',
  ];
}

class TripType {
  var items = [
    'ไม่ระบุบ',
    'คู่รัก',
    'ครอบครัว',
    'เพือน',
  ];
}
