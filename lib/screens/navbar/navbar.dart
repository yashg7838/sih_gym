import 'package:flutter/material.dart';
import 'package:sih_gym/screens/Profile.dart';
import 'package:sih_gym/screens/home/home_page.dart';
import 'package:sih_gym/screens/search.dart';



class NavBarApp extends StatefulWidget {
  @override
  _NavBarAppState createState() => _NavBarAppState();
}

class _NavBarAppState extends State<NavBarApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home_for_new(),
    search(),
    profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(child: _widgetOptions.elementAt(_selectedIndex),
    ), bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
    ),
    ],
    currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,

    onTap: _onItemTapped,
    ),
          extendBody: true,
        ),
    );
  }
}