import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class SkillDropDown extends StatefulWidget {
  const SkillDropDown({super.key});

  @override
  State<SkillDropDown> createState() => _SkillDropDownState();
}

class _SkillDropDownState extends State<SkillDropDown> {
  List category = [
    'Skill-1',
    'Skill-2',
    'Skill-3',
    'Skill-4',
    'Skill-5',
  ];
  String? selectedItem = 'Skill-1';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: DropdownButton<String>(
        dropdownColor: CustomColors.backgroundColor,
        menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
        isExpanded: true,
        hint: Text("choose-category".tr().toString()),
        value: selectedItem,
        iconSize: 45,
        elevation: 16,
        style: TextStyle(color: CustomColors.blackTextColor),
        underline: Container(
          height: 1,
          color: CustomColors.blackTextColor,
        ),
        items: category
            .map((cat) => DropdownMenuItem<String>(
                value: cat,
                child: Text(
                  cat,
                  style: TextStyle(
                      color: CustomColors.blackTextColor, fontSize: 12),
                )))
            .toList(),
        onChanged: (cat) async {
          setState(() {
            selectedItem = cat;
          });
        },
      ),
    );
  }
}
