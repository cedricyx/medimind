import 'package:flutter/material.dart';
import 'package:medimind/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medimind/widgets/notification.dart';
import 'package:medimind/widgets/videoplayer.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  bool dawnCheckbox = false;
  bool morningCheckbox = false;
  bool afternoonCheckbox = false;
  bool eveningCheckbox = false;
  bool nightCheckbox = false;
  int pills = 1;
  String videoName = "";
  List<String> list1 = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '∞',
  ];
  String medDuration = "1";
  final TextEditingController _medNameController = TextEditingController();

  final CollectionReference _medimind =
      FirebaseFirestore.instance.collection('medimind');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  width: double.infinity,
                  // height: 670,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            offset: Offset(0.00, 10.0))
                      ]),
                  child: Column(
                    children: <Widget>[
                      //hghjghjg

                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),

                      // ********************* Start of Medicine Name *********************
                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                    size: 50,
                                    color: Colors.blue,
                                    Icons.badge_outlined),
                                title: Text(
                                  'medname'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('nameDesc'.tr()),
                              ),
                              SizedBox(
                                width: 325,
                                child: TextField(
                                  controller: _medNameController,
                                  decoration: InputDecoration(
                                    labelText: 'enterName'.tr(),
                                    filled: false, //<-- SEE HERE
                                    fillColor: Colors.grey,
                                  ),

                                  keyboardType: TextInputType.multiline,
                                  minLines: 1, // <-- SEE HERE
                                  maxLines: 1, // <-- SEE HERE
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),

                      // ********************* Start of Time *********************

                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                    size: 50,
                                    color: Colors.blue,
                                    Icons.schedule_outlined),
                                title: Text(
                                  'time'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('timeDesc'.tr()),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                        iconSize: 40,
                                        onPressed: () {},
                                        icon: new Image.asset(
                                            'assets/images/dawn.png')),
                                    IconButton(
                                        iconSize: 40,
                                        onPressed: () {},
                                        icon: new Image.asset(
                                            'assets/images/morning.png')),
                                    IconButton(
                                        iconSize: 40,
                                        onPressed: () {},
                                        icon: new Image.asset(
                                            'assets/images/afternoon.png')),
                                    IconButton(
                                        iconSize: 40,
                                        onPressed: () {},
                                        icon: new Image.asset(
                                            'assets/images/evening.png')),
                                    IconButton(
                                        iconSize: 40,
                                        onPressed: () {},
                                        icon: new Image.asset(
                                            'assets/images/night.png')),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Checkbox(
                                    value: dawnCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        dawnCheckbox = !dawnCheckbox;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    value: morningCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        morningCheckbox = !morningCheckbox;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    value: afternoonCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        afternoonCheckbox = !afternoonCheckbox;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    value: eveningCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        eveningCheckbox = !eveningCheckbox;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    value: nightCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        nightCheckbox = !nightCheckbox;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      // ********************* Start of Dosage *********************
                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                    size: 55,
                                    color: Colors.blue,
                                    Icons.medication_rounded),
                                title: Text(
                                  'dosage'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('dosageDesc'.tr()),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.blue,
                                      onPressed: () {
                                        setState(() {
                                          if (pills < 5) {
                                            pills = pills + 1;
                                          } else {}
                                          //calling setState to decrease count by 1
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    Text(
                                      pills.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40,
                                        letterSpacing: 0.27,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.blue,
                                      onPressed: () {
                                        setState(() {
                                          if (pills > 0) {
                                            pills = pills - 1;
                                          } else {} //calling setState to decrease count by 1
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      // ********************* Start of Duration *********************
                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                    size: 55,
                                    color: Colors.blue,
                                    Icons.calendar_month),
                                title: Text(
                                  'duration'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('durationDesc'.tr()),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    DropdownButton<String>(
                                      value: medDuration,
                                      elevation: 16,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        letterSpacing: 0.27,
                                        color: Colors.black,
                                      ),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          medDuration = value!;
                                        });
                                      },
                                      items: list1
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    Text(
                                      "durationDay".tr(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        letterSpacing: 0.27,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),

                      // ********************* Start of Visual Aids *********************
                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                    size: 50,
                                    color: Colors.blue,
                                    Icons.elderly_sharp),
                                title: Text(
                                  'visualaids'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('visualaidsDesc'.tr()),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 70,
                                      color: Colors.grey,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.photo,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 90,
                                      color: Colors.blue,
                                      onPressed: () async {
                                        final ImagePicker picker =
                                            ImagePicker();
                                        // Capture a video.
                                        XFile? cameraVideo =
                                            await picker.pickVideo(
                                                source: ImageSource.camera);

                                        setState(() {
                                          videoName = cameraVideo!
                                              .path; //calling setState to decrease count by 1
                                        });
                                      },
                                      icon: Icon(
                                        Icons.video_call,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 60,
                                      color: Colors.grey,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.mic,
                                      ),
                                    ),
                                  ]),
                              if (videoName != '')
                                SizedBox(
                                    width: 300, child: VideoApp(videoName)),
                              if (videoName == '')
                                SizedBox(
                                  width: 300,
                                  child: Text('NoVisualAids'.tr(),
                                      textAlign: TextAlign.center),
                                ),
                              // SizedBox(width: 300, child: _handlePreview()),
                            ],
                          ),
                        ),
                      ),

                      // ********************* Start of Notification Demo *********************

                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                  leading: Icon(
                                      size: 40,
                                      color: Colors.blue,
                                      Icons.notifications_active),
                                  title: Text(
                                    'notification'.tr(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      letterSpacing: 0.27,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text('testnotificationDesc'.tr()),
                                  trailing: IconButton(
                                    iconSize: 40,
                                    color: Colors.orange,
                                    onPressed: () {
                                      NotificationController
                                          .createNewNotification();
                                    },
                                    icon: Icon(
                                      Icons.ads_click_sharp,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      SizedBox(
                        width: 365,
                        child: ElevatedButton(
                          child: Text(
                            'save'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              letterSpacing: 0.27,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            DateTime now = new DateTime.now();
                            DateTime date =
                                new DateTime(now.year, now.month, now.day);
                            if (medDuration == '∞') {
                              medDuration = "5000";
                            }
                            await _medimind
                                .doc("999")
                                .collection("medicines")
                                .add({
                              "medicineName": _medNameController.text,
                              "dawn": dawnCheckbox,
                              "morning": morningCheckbox,
                              "afternoon": afternoonCheckbox,
                              "evening": eveningCheckbox,
                              "night": nightCheckbox,
                              "dosage": pills,
                              "duration": medDuration,
                              "startDate": date,
                              "endDate": date
                                  .add(Duration(days: int.parse(medDuration))),
                              "videoName": videoName,
                            });
                            // Show a snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('saveMedicine'.tr())));
                          },
                        ),
                      )
                    ],
                  ))
            ]),
          ],
        ))));
  }

  List<DropdownMenuItem> get dropdownItems {
    List<DropdownMenuItem> menuItems = [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
      DropdownMenuItem(child: Text("5"), value: "5"),
      DropdownMenuItem(child: Text("6"), value: "6"),
      DropdownMenuItem(child: Text("7"), value: "7"),
      DropdownMenuItem(child: Text("8"), value: "8"),
      DropdownMenuItem(child: Text("9"), value: "9"),
      DropdownMenuItem(child: Text("10"), value: "10"),
    ];
    return menuItems;
  }
}
