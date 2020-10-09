import 'package:flutter/material.dart';
import 'package:team_23/screens/events_screen.dart';
import 'package:team_23/screens/user_profile_screen.dart';
import 'package:team_23/screens/wishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _screens;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    _screens = [
      {
        'id': 0,
        'title': 'Upcoming Events',
        'page': Center(
          child: Text('Hello'),
        )
      },
      {'id': 1, 'title': 'WishList', 'page': WishList()},
      {'id': 2, 'title': 'Profile', 'page': UserProfileScreen()}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
        backgroundColor: Color(0xff374ABE),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        backgroundColor: Color(0xff374ABE),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.event,
                color: Colors.amber,
              ),
              title: Text('Events')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.amber,
              ),
              title: Text('Wishlist')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.amber,
              ),
              title: Text('Profile')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
      body: _screens[_selectedIndex]['page'],
    );
  }
}
