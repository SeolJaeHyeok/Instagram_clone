import 'package:flutter/material.dart';
import 'package:instagram_clone/acount_page.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TabPage extends StatefulWidget {
  final FirebaseUser user;

  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages = [
    HomePage(),
    SearchPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child : _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemtapped ,
        currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('search')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('account'))
      ]),
    );
  }

  void _onItemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
