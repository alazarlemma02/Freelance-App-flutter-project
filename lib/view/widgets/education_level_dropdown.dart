import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/edit_profile_page.dart';

class EducationLevelDropDown extends StatefulWidget {
  const EducationLevelDropDown({super.key});

  @override
  State<EducationLevelDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<EducationLevelDropDown> {
  EditProfilePage editProfilePage = new EditProfilePage();
  List category = [
    'high school diploma',
    'college degree',
    'masters degree',
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: DropdownButton<String>(
        dropdownColor: CustomColors.backgroundColor,
        menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
        isExpanded: true,
        hint: Text("education-level".tr().toString()),
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
