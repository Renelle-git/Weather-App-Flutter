// navigation controller is used to control the navigation between the pages
// this is used to avoid the need to navigate between the pages in the main.dart file.
import 'package:get/get.dart';

class NavigationContoller extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}