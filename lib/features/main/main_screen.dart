import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_list/features/profile/profile_screen.dart';
import 'package:todo_list/features/todo/todo_screen.dart';
import '../../view/utils/themes.dart';
import 'main_home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    ProfileScreen(),
  ];
  void onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [IconButton(onPressed: () {}, icon: Icon(IconlyLight.search)),IconButton(onPressed: () {}, icon: Icon(IconlyLight.logout))],
        title: Text('Todo App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
      ),
      backgroundColor: Colors.white,
      body: HomeScreen(),
    );
  }
}
