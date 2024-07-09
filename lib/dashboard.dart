import 'package:flutter/material.dart';
import 'package:votev/friends.dart';
import 'package:votev/home.dart';
import 'package:votev/history.dart';
import 'package:votev/leaderboard.dart';
import 'package:votev/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String message = '';
  int myIndex = 0;
  List<Widget> widgetList = const [Home(), Friends(), Leaderboard(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (index) => {
            setState(() {
              myIndex = index;
            })
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 18,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                size: 20,
              ),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.leaderboard,
                size: 20,
              ),
              label: 'Leaderboard',
            ),
          ],
          selectedItemColor:
              Color.fromARGB(255, 4, 255, 12), // Set selected item color
          unselectedItemColor: Color.fromARGB(255, 225, 225, 225),
          showSelectedLabels: true,
          showUnselectedLabels: true, // Set unselected item color
        ),
      ),
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
    );
  }
}
