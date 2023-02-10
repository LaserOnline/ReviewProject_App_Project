import '../../MyPage/Screens/Screens_Deal.dart';
import '../../MyPage/Screens/Screens_Home.dart';
import '../../MyPage/Screens/Screens_Trip.dart';
import '../../MyPage/Screens/Screens_4.dart';
import '../AdminControl/Admin.dart';
import '../../MyPage/Screens/Screen_Search.dart';

class SelectPage {
  int currentIndex = 0;
  final Page = [
    Screens_Home(),
    Screens_Deal(),
    Search(),
    Trip(),
  ];
}
