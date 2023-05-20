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
    return Scaffold(
        body: ListView(
      children: [
        // 3.
        RadioListTile<Languages>(
          secondary: Icon(Icons.language_rounded),
          controlAffinity: ListTileControlAffinity.trailing,
          title:  Text('english'.tr()),
          // 4.
          value: Languages.english,
          // 5.
          groupValue: _languages,
          // 6.
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
          title:  Text('chinese'.tr()),
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
}
