import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/edit_profile_page.dart';

class ExperienceLevelDropDown extends StatefulWidget {
  final String expTxt;
  final Function onSelect;
  const ExperienceLevelDropDown(
      {super.key, required this.expTxt, required this.onSelect});

  @override
  State<ExperienceLevelDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<ExperienceLevelDropDown> {
  List category = ['Beginner', 'Intermidiate', 'Expert'];
  String? selectedItem;
  // EditProfilePage editProfilePage = new EditProfilePage();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: DropdownButton<String>(
        dropdownColor: CustomColors.backgroundColor,
        menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
        isExpanded: true,
        hint: Text("experience-level".tr().toString()),
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
          // editProfilePage.setExp(selectedItem.toString());
          // widget.onSelect;
        },
        onTap: () {
          widget.onSelect(selectedItem);
        },
      ),
    );
  }
}
