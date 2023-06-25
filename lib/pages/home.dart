import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medimind/widgets/constants.dart';
import 'package:medimind/widgets/videoplayer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime _selectedDate;
  String formattedDate = '';
  final CollectionReference _medimind =
      FirebaseFirestore.instance.collection('medimind');

  @override
  void initState() {
    super.initState();
    DocumentReference docref = FirebaseFirestore.instance.doc("medimind/999");
    docref.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //Existing

        setState(() {
          Constant.profileName = documentSnapshot["profileName"];
          Constant.profileEmail = documentSnapshot["profileEmail"];

          // _profileMobileController.text = documentSnapshot["profileMobile"];
          if (documentSnapshot["profileImage"] != '') {
            // _profilePicFile = File(documentSnapshot["profileImage"]);
            Constant.profileAvatarPath = documentSnapshot["profileImage"];
          }
        });
      } else {
        //New
      }
    });

    _resetSelectedDate();
    formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          //Avatar
          Card(
            elevation: 10, // the size of the shadow
            shadowColor: Colors.black, // shadow color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:                    
                    Constant.profileAvatarPath==''?AssetImage('assets/images/defaultprofile.png'):Image.file(File(Constant.profileAvatarPath)).image,
                radius: 35,
              ),
              title: Text(
                Constant.profileName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: 0.27,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(Constant.profileEmail),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          //Calender
          Card(
            elevation: 10, // the size of the shadow
            shadowColor: Colors.black, // shadow color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CalendarTimeline(
                showYears: true,
                initialDate: _selectedDate,
                firstDate:
                    DateTime.now().subtract(const Duration(days: 365 * 1)),
                lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
                onDateSelected: (date) => setState(() {
                  _selectedDate = date;
                  formattedDate =
                      DateFormat('dd-MM-yyyy').format(_selectedDate);
                }),
                leftMargin: 20,
                monthColor: Colors.black54,
                dayColor: Colors.teal[200],
                dayNameColor: const Color(0xFF333A47),
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.redAccent[100],
                dotsColor: const Color(0xFF333A47),
                //selectableDayPredicate: (date) => date.day != 23,
                locale: 'en',
              ),
            ),
          ),
          //Today's Medicine
          Card(
            elevation: 10, // the size of the shadow
            shadowColor: Colors.black, // shadow color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Center(
              child: Text(
            "today".tr() + " " + formattedDate,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              letterSpacing: 0.27,
              color: Colors.black,
            ),
          )),
          Container(
            height: 390,
            child: StreamBuilder(
                stream: _medimind
                    .doc("999")
                    .collection("medicines")
                    .orderBy('medicineName')
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          Timestamp startdate = documentSnapshot["startDate"];
                          Timestamp enddate = documentSnapshot["endDate"];
                          String videoName = documentSnapshot["videoName"];
                          // Only display card if selected date is between the start date and end date
                          bool displayMedicine = (_selectedDate
                                      .compareTo(startdate.toDate()) >=
                                  0 &&
                              _selectedDate.compareTo(enddate.toDate()) <= 0);

                          return Visibility(
                            visible: displayMedicine ? true : false,
                            child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                  Card(
                                    // Play Video
                                    child: Column(
                                      children: [
                                        // Medicine Name
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            documentSnapshot["medicineName"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              letterSpacing: 0.27,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        // Preview Video

                                        if (videoName != '')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                    height: 230,
                                                    width: 230,
                                                    child: VideoApp(
                                                        documentSnapshot[
                                                            "videoName"])),
                                              ],
                                            ),
                                          ),
                                        if (videoName == '')
                                          SizedBox(
                                            height: 230,
                                            width: 230,
                                            child: Text('emptyVisualAids'.tr(),
                                                textAlign: TextAlign.center),
                                          ),

                                        // Medicine Timing
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              if (documentSnapshot["dawn"])
                                                IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: Tooltip(
                                                      message: "5am",
                                                      child: new Image.asset(
                                                          Constant.dawnImg),
                                                    )),
                                              if (documentSnapshot["morning"])
                                                IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: Tooltip(
                                                      message: "10am",
                                                      child: new Image.asset(
                                                          'assets/images/morning.png'),
                                                    )),
                                              if (documentSnapshot["afternoon"])
                                                IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: Tooltip(
                                                      message: "3pm",
                                                      child: new Image.asset(
                                                          'assets/images/afternoon.png'),
                                                    )),
                                              if (documentSnapshot["evening"])
                                                IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: Tooltip(
                                                      message: "7pm",
                                                      child: new Image.asset(
                                                          'assets/images/evening.png'),
                                                    )),
                                              if (documentSnapshot["night"])
                                                IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: Tooltip(
                                                      message: "10pm",
                                                      child: new Image.asset(
                                                          'assets/images/night.png'),
                                                    )),
                                            ]),
                                        // No of pills
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              for (var i = 0;
                                                  i <
                                                      documentSnapshot[
                                                          "dosage"];
                                                  i++)
                                                IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: new Image.asset(
                                                        'assets/images/pill.png')),
                                            ]),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -1,
                                    right: -3,
                                    child: IconButton(
                                        iconSize: 30,
                                        onPressed: () async {
                                          await _medimind
                                              .doc("999")
                                              .collection("medicines")
                                              .doc(documentSnapshot.id)
                                              .delete();
                                          // Show a snackbar
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'deleteMedicine'.tr())));
                                        },
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          )
        ]),
      )),
    );
  }
}
