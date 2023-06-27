import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medimind/pages/addmedicine.dart';
import 'package:medimind/pages/home.dart';
import 'package:medimind/pages/profile.dart';
import 'package:medimind/pages/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medimind/widgets/bottomnavigation.dart';
import 'package:medimind/widgets/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await EasyLocalization.ensureInitialized();
  // Always initialize Awesome Notifications
  await NotificationController.initializeLocalNotifications();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('zh', 'SG'), Locale('ms', 'MY'), Locale('fr', 'FR'),],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //theme: ThemeData(useMaterial3: true),
        home: BottomNavigation());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('zh', 'SG'));
    return Scaffold(
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

// class BottomNavigationExample extends StatefulWidget {
//   const BottomNavigationExample({Key? key}) : super(key: key);

//   @override
//   _BottomNavigationExampleState createState() =>
//       _BottomNavigationExampleState();
// }

// class _BottomNavigationExampleState extends State {
//   int _selectedTab = 0;
//   var _selectedTabName = "home".tr();

//   List _pages = [
//     Home(),
//     AddMedicine(),
//     Profile(),
//     Setting(),
//   ];

//   _changeTab(int index) {
//     setState(() {
//       _selectedTab = index;
//       if (_selectedTab == 0) {
//         _selectedTabName = "home".tr();
//       }
//       if (_selectedTab == 1) {
//         _selectedTabName = "addmedicine".tr();
//       }
//       if (_selectedTab == 2) {
//         _selectedTabName = "profile".tr();
//       }
//       if (_selectedTab == 3) {
//         _selectedTabName = "setting".tr();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(size: 40, Icons.apps),
//         title: Text(_selectedTabName),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: <Color>[Colors.black, Colors.lightBlueAccent]),
//           ),
//         ),
//       ),
//       body: _pages[_selectedTab],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedTab,
//         backgroundColor: Colors.lightBlueAccent,
//         onTap: (index) => _changeTab(index),
//         selectedItemColor: Colors.orangeAccent,
//         unselectedItemColor: Colors.white,
//         selectedFontSize: 15,
//         unselectedFontSize: 15,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "home".tr(),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.add_circle_outline_rounded),
//               label: "addmedicine".tr()),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person_2_rounded), label: "profile".tr()),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: "setting".tr()),
//         ],
//       ),
//     );
//   }
// }
