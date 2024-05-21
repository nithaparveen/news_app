import 'package:flutter/material.dart';
import 'package:newsapp/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff8c2f35),
          ),
          child: BottomNavigationBar(selectedItemColor: Colors.white,
          backgroundColor:const Color(0xff8c2f35) ,
          currentIndex: Provider.of<BottomNavController>(context).selectedindex,
            onTap: Provider.of<BottomNavController>(context,listen: false).onItemTap,
            elevation: 0,
            items: const [BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),]
          ),
        ),
      ),
    );
  }
}
