import 'package:newsapp/controller/bottom_nav_controller.dart';
import 'package:newsapp/controller/category_controller.dart';
import 'package:newsapp/controller/search_screen_controller.dart';
import 'package:newsapp/view/bottom_nav_bar/main_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'controller/home_screen_controller.dart';
void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
