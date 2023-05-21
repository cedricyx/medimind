import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum Languages { english, chinese }

// 2.
Languages? _languages = Languages.english;

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)?.locale;
    if (locale?.languageCode == "zh")
      _languages = Languages.chinese;
    else
      _languages = Languages.english;
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10.0),
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
                            offset: Offset(0.00, 10.0))
                      ]),
                  child: Column(children: <Widget>[
                    ListTile(
                      leading: Icon(
                          size: 40,
                         Icons.language_outlined),
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
                    RadioListTile<Languages>(
                      secondary: Icon(Icons.arrow_forward_ios_rounded),
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
                      secondary: Icon(Icons.arrow_forward_ios_rounded),
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
                    Divider(
                      thickness: 3,
                    
                    ),
                        ListTile(
                      leading: Icon(
                          size: 40,
                        Icons.notification_important),
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
                  ])),
            ]),
          ],
        ))));
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
}
