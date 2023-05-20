import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medimind/pages/addmedicine.dart';
import 'package:medimind/pages/home.dart';
import 'package:medimind/pages/profile.dart';
import 'package:medimind/pages/setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('zh', 'SG')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: BottomNavigationExample());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('zh', 'SG'));
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello'.tr()),
            Text('world'.tr()),
          ],
        ),
      ),
    );
  }
}
class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  List _pages = [
    Home(),
    AddMedicine(),
    Profile(),
    Setting(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.lightBlue,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr(), backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded), label: "addmedicine".tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: "profile".tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "setting".tr()),
        ],
        
      ),
    );
  }
}