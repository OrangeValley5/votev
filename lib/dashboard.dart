import 'package:flutter/material.dart';
import 'package:votev/home.dart';
import 'package:votev/history.dart';
import 'package:votev/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String message = '';
  int myIndex = 0;
  List<Widget> widgetList = const [Home(), History(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
              Icons.note,
              size: 20,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notification_add,
                size: 18,
              ),
              label: 'Account'),
        ],
        selectedItemColor: Colors.black, // Set selected item color
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true, // Set unselected item color
      ),
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
    );
  }
}
