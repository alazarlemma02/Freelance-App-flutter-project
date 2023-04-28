import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/edit_profile_page.dart';

class SkillDropDown extends StatefulWidget {
  String? item;
  final Function callbackFunction;
  SkillDropDown({super.key, this.item, required this.callbackFunction});

  @override
  State<SkillDropDown> createState() => _SkillDropDownState();
}

class _SkillDropDownState extends State<SkillDropDown> {
  // EditProfilePage editProfilePage = new EditProfilePage();
  List category = [
    "communication".tr().toString(),
    "marketing".tr().toString(),
    "creativity".tr().toString(),
    "project-management".tr().toString(),
    "writing-and-research-skills".tr().toString(),
     "others".tr().toString()
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.item = selectedItem;
        widget.callbackFunction(widget.item);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: DropdownButton<String>(
          dropdownColor: CustomColors.backgroundColor,
          menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
          isExpanded: true,
          hint: Text("choose-skill".tr().toString()),
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
          onChanged: (cat) {
            widget.callbackFunction(cat);
            setState(() {
              selectedItem = cat;
            });
          },
        ),
      ),
    );
  }
}
