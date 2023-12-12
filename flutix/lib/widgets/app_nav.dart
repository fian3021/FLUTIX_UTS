import 'package:flutix/screens/home_movies.dart';
import 'package:flutix/screens/my_ticket.dart';
import 'package:flutix/screens/profile.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutix/widgets/app_nav.dart';

class App_Nav extends StatefulWidget {
  const App_Nav({super.key});

  @override
  State<App_Nav> createState() => _App_NavState();
}

class _App_NavState extends State<App_Nav> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[const Home_Movies(), MyTickets(), Profile()];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.movie),
        label: 'Movies',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.confirmation_number),
        label: 'My Tickets',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_rounded),
        label: 'Profile',
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 180, 212, 41),
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: Color.fromRGBO(125, 125, 126, 1),
      selectedItemColor: Color.fromARGB(255, 54, 53, 56),
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
