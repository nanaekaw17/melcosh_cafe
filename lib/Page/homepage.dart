import 'package:flutter/material.dart';
import 'package:melcosh_cafe/subPage/history_subpage.dart';
import 'package:melcosh_cafe/subPage/home_subpage.dart';
import 'package:melcosh_cafe/subPage/menu_subpage.dart';
import 'package:melcosh_cafe/subPage/profile_subpage.dart';
import 'package:melcosh_cafe/subPage/store_subpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomeSubPage(),
    HistorySubPage(),
    // MenuSubPage(),
    StoreSubPage(),
    ProfileSubPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: 'History',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.category),
            //   label: 'Menu',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
