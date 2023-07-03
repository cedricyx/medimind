import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flag/flag.dart';
import 'package:medimind/widgets/notification.dart';

enum Languages {
  english,
  chinese,
  malay,
  tamil,
  french,
  finnish,
  german,
  italian,
  japanese,
  portugese,
}

// 2.
Languages? _languages = Languages.english;

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool vibrationCheckbox = true;
  bool soundCheckbox = true;
  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)?.locale;
    if (locale?.languageCode == "zh")
      _languages = Languages.chinese;
    else if (locale?.languageCode == "ms")
      _languages = Languages.malay;
    else if (locale?.languageCode == "ta")
      _languages = Languages.tamil;
    else if (locale?.languageCode == "fr")
      _languages = Languages.french;
    else if (locale?.languageCode == "fi")
      _languages = Languages.finnish;
    else if (locale?.languageCode == "de")
      _languages = Languages.german;
    else if (locale?.languageCode == "it")
      _languages = Languages.italian;
    else if (locale?.languageCode == "ja")
      _languages = Languages.japanese;
    else if (locale?.languageCode == "pt")
      _languages = Languages.portugese;
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.SG,
                                         
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('english'.tr())),
                                      ],
                                    ),
                                    value: Languages.english,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.SG,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text(
                                              'chinese'.tr(),
                                            )),
                                      ],
                                    ),
                                    value: Languages.chinese,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.SG,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('malay'.tr())),
                                      ],
                                    ),
                                    value: Languages.malay,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.SG,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text(
                                              'tamil'.tr(),
                                            )),
                                      ],
                                    ),
                                    value: Languages.tamil,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.FI,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('finnish'.tr())),
                                      ],
                                    ),
                                    value: Languages.finnish,
                                  ),
                                  
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.FR,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('french'.tr())),
                                      ],
                                    ),
                                    value: Languages.french,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.DE,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('german'.tr())),
                                      ],
                                    ),
                                    value: Languages.german,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.IT,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('italian'.tr())),
                                      ],
                                    ),
                                    value: Languages.italian,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.JP,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('japanese'.tr())),
                                      ],
                                    ),
                                    value: Languages.japanese,
                                  ),
                                  DropdownMenuItem<Languages>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flag.fromCode(
                                          FlagsCode.PT,
                                          height: 25,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        SizedBox(
                                            width: 125,
                                            child: Text('portugese'.tr())),
                                      ],
                                    ),
                                    value: Languages.portugese,
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
                                      case Languages.tamil:
                                        context.setLocale(Locale('ta', 'IN'));
                                        break;
                                      case Languages.french:
                                        context.setLocale(Locale('fr', 'FR'));
                                        break;
                                      case Languages.finnish:
                                        context.setLocale(Locale('fi', 'FI'));
                                        break;
                                      case Languages.german:
                                        context.setLocale(Locale('de', 'DE'));
                                        break;
                                      case Languages.italian:
                                        context.setLocale(Locale('it', 'IT'));
                                        break;
                                      case Languages.japanese:
                                        context.setLocale(Locale('ja', 'JP'));
                                        break;
                                      case Languages.portugese:
                                        context.setLocale(Locale('pt', 'PT'));
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
                                      size: 55,
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
                                      if (soundCheckbox == false){
                                        NotificationController
                                          .createNewNotification('nosound');
                                      } else if (vibrationCheckbox == false){
                                        NotificationController
                                          .createNewNotification('novibration');
                                      } else {
                                        NotificationController
                                          .createNewNotification(locale!.languageCode);
                                      }                                     
                                    },
                                    icon: Icon(
                                      Icons.ads_click_sharp,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),                      ],
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