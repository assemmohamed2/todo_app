import 'package:get/get.dart';
import 'package:todo_list/features/main/main_screen.dart';

import '../../features/profile/profile_screen.dart';
import '../../features/todo/todo_screen.dart';


class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
   MainScreen(),
    ProfileScreen()

  ].obs;

  var title = [
    "Home",
    "ToDo",
    "Profile",
  ].obs;
}