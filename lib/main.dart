import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medimind/widgets/bottomnavigation.dart';
import 'package:medimind/widgets/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'firebase_options.dart';
import 'package:firebase_ui_auth/src/providers/email_auth_provider.dart'
    as email_auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Always initialize Awesome Notifications
  await NotificationController.initializeLocalNotifications();
  // Initialising Firebaser Authernication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([email_auth.EmailAuthProvider()]);

  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'SG'),
          Locale('ta', 'IN'),
          Locale('ms', 'MY'),
          Locale('fr', 'FR'),
          Locale('fi', 'FI'),
          Locale('de', 'DE'),
          Locale('it', 'IT'),
          Locale('ja', 'JP'),
          Locale('pt', 'PT'),
        ],
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
        title: '2A3 PW 2023 Medimind',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? '/sign-in'
            : '/medimind',
        routes: {
          '/sign-in': (context) {
            return SignInScreen(
              headerBuilder: (context, constraints, _) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                    action == AuthAction.signIn
                        ? 'Welcome to Medimind! Please sign in to continue.'
                        : 'Welcome to Medimind! Please create an account to continue',
                  ),
                );
              },
              footerBuilder: (context, _) {
                return Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: SizedBox(
                    // height: 50,
                    height: 70,
                    child: Image.asset("assets/images/brand.png"),
                  ),
                );
              },
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/medimind');
                }),
              ],
            );
          },
          '/medimind': (context) => BottomNavigation(),
          '/profile': (context) {
            return ProfileScreen(
              actions: [
                SignedOutAction((context) {
                  Navigator.pushReplacementNamed(context, '/sign-in');
                }),
              ],
            );
          },
        });
  }
}

class MyApp_backup extends StatelessWidget {
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
