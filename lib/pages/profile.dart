import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medimind/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:editable_image/editable_image.dart';
import 'package:medimind/main.dart';
import 'package:easy_localization/easy_localization.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _profilePicFile;
  final TextEditingController _profileNameController = TextEditingController();
  final TextEditingController _profileEmailController = TextEditingController();
  final TextEditingController _profileMobileController =
      TextEditingController();
  bool isNew = true;

  final CollectionReference _medimind =
      FirebaseFirestore.instance.collection('medimind');
  @override
  void initState() {
    super.initState();
    //Retrieving document from Firestore
    DocumentReference docref = FirebaseFirestore.instance.doc("medimind/999");
    docref.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //Existing

        setState(() {
          isNew = false;
          _profileNameController.text = documentSnapshot["profileName"];
          _profileEmailController.text = documentSnapshot["profileEmail"];
          _profileMobileController.text = documentSnapshot["profileMobile"];
          if (documentSnapshot["profileImage"] != '') {
            _profilePicFile = File(documentSnapshot["profileImage"]);
          }
        });
      } else {
        //New
        isNew = true;
      }
    });
  }

  void _directUpdateImage(File? file) async {
    if (file == null) return;

    setState(() {
      _profilePicFile = file;
    });
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
                height: 680,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(100.0),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.00, 10.0)),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      ),
                      EditableImage(
                        // Define the method that will run on the change process of the image.

                        onChange: (file) => _directUpdateImage(file),

                        // Define the source of the image.
                        image: _profilePicFile != null
                            ? Image.file(_profilePicFile!, fit: BoxFit.cover)
                            : null,

                        // Define the size of EditableImage.
                        size: 135.0,

                        // Define the Theme of image picker.
                        imagePickerTheme: ThemeData(
                          // Define the default brightness and colors.
                          primaryColor: Colors.white,
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.white70,
                          iconTheme: const IconThemeData(color: Colors.black87),

                          // Define the default font family.
                          fontFamily: 'Georgia',
                        ),

                        // Define the border of the image if needed.
                        imageBorder:
                            Border.all(color: Colors.black87, width: 2.0),

                        // Define the border of the icon if needed.
                        editIconBorder:
                            Border.all(color: Colors.black87, width: 2.0),
                      ),
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
                                  'profilename'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('profilenamedesc'.tr()),
                              ),
                              SizedBox(
                                width: 325,
                                child: TextField(
                                  controller: _profileNameController,
                                  decoration: InputDecoration(
                                    labelText: 'enterprofilename'.tr(),
                                    filled: false, //<-- SEE HERE
                                    fillColor: Colors.grey,
                                  ),

                                  keyboardType: TextInputType.multiline,
                                  minLines: 1, // <-- SEE HERE
                                  maxLines: 1, // <-- SEE HERE
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
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
                                    Icons.email_outlined),
                                title: Text(
                                  'email'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('profileemaildesc'.tr()),
                              ),
                              SizedBox(
                                width: 325,
                                child: TextField(
                                  controller: _profileEmailController,
                                  decoration: InputDecoration(
                                    labelText: 'enterprofileemail'.tr(),
                                    filled: false, //<-- SEE HERE
                                    fillColor: Colors.grey,
                                  ),

                                  keyboardType: TextInputType.multiline,
                                  minLines: 1, // <-- SEE HERE
                                  maxLines: 1, // <-- SEE HERE
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Card(
                        elevation: 2, // the size of the shadow
                        shadowColor: Colors.black, // shadow color

                        child: SizedBox(
                          width: 365,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                    size: 50, color: Colors.blue, Icons.phone),
                                title: Text(
                                  'mobile'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('profilemobiledesc'.tr()),
                              ),
                              SizedBox(
                                width: 325,
                                child: TextField(
                                  controller: _profileMobileController,

                                  decoration: InputDecoration(
                                    labelText: 'enterprofilemobile'.tr(),
                                    filled: false, //<-- SEE HERE
                                    fillColor: Colors.grey,
                                  ),

                                  keyboardType: TextInputType.number,
                                  minLines: 1, // <-- SEE HERE
                                  maxLines: 1, // <-- SEE HERE
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
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
                            String avatarImage = _profilePicFile == null
                                ? ''
                                : _profilePicFile!.path;
                            if (isNew) {
                            } else {
                              await _medimind.doc("999").update({
                                "profileName": _profileNameController.text,
                                "profileEmail": _profileEmailController.text,
                                "profileMobile": _profileMobileController.text,
                                "profileImage": avatarImage,
                              });
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('saveProfile'.tr())));
                          },
                        ),
                      )
                    ],
                  ),
                ),

                //start here
              ),
            ]),
          ],
        ))));
  }
}
