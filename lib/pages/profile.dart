import 'dart:io';

import 'package:flutter/material.dart';
import 'package:editable_image/editable_image.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _profilePicFile;
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
                height: 670,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,0),
                  child: EditableImage(
                // Define the method that will run on the change process of the image.
                    onChange: (file) => _directUpdateImage(file),
                
                // Define the source of the image.
                    image: _profilePicFile != null
                        ? Image.file(_profilePicFile!, fit: BoxFit.cover)
                        : null,
                
                // Define the size of EditableImage.
                    size: 150.0,
                
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
                    imageBorder: Border.all(color: Colors.black87, width: 2.0),
                
                // Define the border of the icon if needed.
                    editIconBorder: Border.all(color: Colors.black87, width: 2.0),
                  ),
                ),
 
                //start here
              )
            ]),
          ],
        ))));
  }
}
