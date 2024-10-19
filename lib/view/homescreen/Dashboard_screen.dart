import 'package:flutter/material.dart';
import 'package:rbt_app/utils/app_colors.dart';
import 'package:rbt_app/view/homescreen/Home/home_screen.dart';
import 'package:rbt_app/view/product/Product_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        backgroundColor: AppColors.primaryColor,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_outlined),
            label: 'Product',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.whiteColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
