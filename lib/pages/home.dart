import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medimind/pages/calendar.dart';
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
        Card(
          elevation: 10, // the size of the shadow
          shadowColor: Colors.black, // shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),

          child: Container(
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 12, left: 10, right: 10),
            //  width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CalendarTimeline(
                  showYears: true,
                  initialDate: _selectedDate,
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 365 * 1)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 1)),
                  onDateSelected: (date) =>
                      setState(() => _selectedDate = date),
                  leftMargin: 0,
                  monthColor: Colors.black54,
                  dayColor: Colors.teal[200],
                  dayNameColor: const Color(0xFF333A47),
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: Colors.redAccent[100],
                  dotsColor: const Color(0xFF333A47),
                  // selectableDayPredicate: (date) => date.day != 23,
                  locale: 'en',
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 10, // the size of the shadow
          shadowColor: Colors.black, // shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),

          child: Container(
            padding: new EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'today'.tr(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.27,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 200.0,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        //  color: Colors.red,
                        child: new Card(
                          elevation: 3, // the size of the shadow
                          shadowColor: Colors.black, // shadow color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),

                          child: Image.asset(
                            'assets/images/grandmother.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                             width: 200.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/grandmother.png"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Text("YOUR TEXT"),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.blue,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.green,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 10, // the size of the shadow
          shadowColor: Colors.black, // shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),

          child: Container(
            padding: new EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[],
            ),
          ),
        ),
      ],
    ));
  }
}
