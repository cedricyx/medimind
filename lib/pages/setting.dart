import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Languages { english, chinese, malay }

// 2.
Languages? _languages = Languages.english;

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool vibrationCheckbox = false;
  bool soundCheckbox = false;
  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)?.locale;
    if (locale?.languageCode == "zh")
      _languages = Languages.chinese;
    else if (locale?.languageCode == "ms")
      _languages = Languages.malay;
    else
      _languages = Languages.english;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 670,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.00, 10.0),
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.language_outlined,
                                  color: Colors.blue,
                                  size: 55,
                                ),
                                title: Text(
                                  'language'.tr(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text('languageDesc'.tr()),
                              ),
                              DropdownButton<Languages>(
                                value: _languages,
                                items: [
                                  DropdownMenuItem<Languages>(
                                    child: Text('english'.tr()),
                                    value: Languages.english,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Text('chinese'.tr()),
                                    value: Languages.chinese,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Text('malay'.tr()),
                                    value: Languages.malay,
                                  ),
                                ],
                                onChanged: (Languages? value) {
                                  setState(() {
                                    _languages = value;
                                    switch (_languages) {
                                      case Languages.english:
                                        context.setLocale(Locale('en', 'US'));
                                        break;
                                      case Languages.chinese:
                                        context.setLocale(Locale('zh', 'SG'));
                                        break;
                                      case Languages.malay:
                                        context.setLocale(Locale('ms', 'MY'));
                                        break;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.notification_important,
                                  color: Colors.blue,
                                  size: 55,
                                ),
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
                                subtitle: Text('notificationDesc'.tr()),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      iconSize: 40,
                                      onPressed: () {},
                                      icon: Icon(Icons.vibration)),
                                  Checkbox(
                                    value: vibrationCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        vibrationCheckbox = !vibrationCheckbox;
                                      });
                                    },
                                  ),
                                  IconButton(
                                      iconSize: 40,
                                      onPressed: () {},
                                      icon: Icon(Icons.volume_up)),
                                  Checkbox(
                                    value: soundCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        soundCheckbox = !soundCheckbox;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



  

  
  
  /*
  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)?.locale;
    if (locale?.languageCode == "zh")
      _languages = Languages.chinese;
    else
      _languages = Languages.english;

    return Scaffold(
        body: ListView(
      children: [
        RadioListTile<Languages>(
          secondary: Icon(Icons.language_rounded),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text('english'.tr()),
          value: Languages.english,
          groupValue: _languages,
          onChanged: (Languages? value) {
            setState(() {
              _languages = value;
              context.setLocale(Locale('en', 'US'));
            });
          },
        ),
        RadioListTile<Languages>(
          secondary: Icon(Icons.language_rounded),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text('chinese'.tr()),
          value: Languages.chinese,
          groupValue: _languages,
          onChanged: (Languages? value) {
            setState(() {
              _languages = value;
              context.setLocale(Locale('zh', 'SG'));
            });
          },
        ),
      ],
    ));
  }
  */