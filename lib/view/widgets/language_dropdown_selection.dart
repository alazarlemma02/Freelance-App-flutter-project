import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/login_page.dart';

class SelectLanguage extends StatefulWidget {
  BuildContext context;
  SelectLanguage({super.key, required this.context});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<String> language = ['English', 'አማርኛ'];
  String? selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      onTap: () {
        selectedLanguage = selectedLanguage;
      },
      icon: Icon(Icons.arrow_drop_down, size: 20),
      dropdownColor: CustomColors.backgroundColor,
      value: selectedLanguage,
      items: language
          .map((lan) => DropdownMenuItem<String>(
              value: lan,
              child: Text(
                lan,
                style:
                    TextStyle(color: CustomColors.blackTextColor, fontSize: 12),
              )))
          .toList(),
      onChanged: (lan) async {
        setState(() {
          selectedLanguage = lan;
          if (selectedLanguage == language[0]) {
            widget.context.setLocale(const Locale('en', 'US'));
          } else if (selectedLanguage == language[1]) {
            widget.context.setLocale(const Locale('am', 'ETH'));
          }
        });
      },
    );
  }
}
