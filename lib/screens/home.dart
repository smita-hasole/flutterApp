import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_digital_id/screens/my_profile.dart';
import 'package:my_digital_id/screens/scanner_screen.dart';
import 'package:my_digital_id/screens/search_screen.dart';
import 'package:my_digital_id/screens/settings_screen.dart';


class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 1;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  var pages =[ new SearchScreen(),new MyProfileScreen(),new ScannerScreen(),new MySettingsScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex= index;
    });

    /* Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new SplashScreen();
    }));
*/
    /* if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new SearchScreen();
      }));
    }
    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new MyProfileScreen();
      }));
    }
    if (index == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new MySettingsScreen();
      }));
    }*/
  }


  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.orange),
            title: Text('Search', style: TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, color: Colors.orange),
            title: Text('Profile', style: TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_style, color: Colors.orange),
            title: Text('Scan', style: TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.orange),
            title: Text('Settings', style: TextStyle(color: Colors.orange)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        }

      ,
      ),
      body: pages[_selectedIndex],



    );
  }
}
