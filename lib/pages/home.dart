import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: new EdgeInsets.all(5.0),
      children: [
        Card(
          elevation: 10, // the size of the shadow
          shadowColor: Colors.black, // shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            width: 300,
            //height: 40,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/grandmother.png'),
                radius: 35,
              ),
              title: Text(
                'Grandmother',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: 0.27,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('+65 9876 5432'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ),
        ],
    ));
  }
}
