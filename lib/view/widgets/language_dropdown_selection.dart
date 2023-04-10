import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<String> language = ['English', 'አማርኛ'];
  String? selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
            context.locale = const Locale('en', 'US');
          } else if (selectedLanguage == language[1]) {
            context.locale = const Locale('am', 'ETH');
          }
        });
      },
    );
  }
}
