import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medimind/pages/addmedicine.dart';
import 'package:medimind/main.dart';
import 'package:medimind/pages/home.dart';
import 'package:medimind/pages/profile.dart';
import 'package:medimind/pages/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medimind/widgets/notification.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State {
  int _selectedTab = 0;
  var _selectedTabName = "home".tr();

  List _pages = [
    Home(),
    AddMedicine(),
    Profile(),
    Setting(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
      if (_selectedTab == 0) {
        _selectedTabName = "home".tr();
      }
      if (_selectedTab == 1) {
        _selectedTabName = "addmedicine".tr();
      }
      if (_selectedTab == 2) {
        _selectedTabName = "profile".tr();
      }
      if (_selectedTab == 3) {
        _selectedTabName = "setting".tr();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(size: 40, Icons.apps),
        title: Text(_selectedTabName),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/sign-in');
            },
            icon: Icon(Icons.logout_outlined),
            iconSize: 35,
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.lightBlueAccent]),
          ),
        ),
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: Colors.lightBlueAccent,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded),
              label: "addmedicine".tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: "profile".tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "setting".tr()),
        ],
      ),
    );
  }
}
