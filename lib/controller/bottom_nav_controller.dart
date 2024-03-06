import 'package:flutter/widgets.dart';
import 'package:newsapp/view/category_screen/category_screen.dart';
import 'package:newsapp/view/home_screen/home_screen.dart';
import 'package:newsapp/view/search_screen/search_screen.dart';

class BottomNavController with ChangeNotifier {
  int selectedindex = 0;

  void onItemTap(index) {
    selectedindex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),CategoryScreen(),SearchScreen()
  ];
}
