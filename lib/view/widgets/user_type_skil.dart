// TODO Implement this library.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class UserTypeAndSkill extends StatefulWidget {
  String? fullName;
  String? category;
  String? skill;
  UserTypeAndSkill(
      {super.key,
      required this.fullName,
      required this.category,
      required this.skill});

  @override
  State<UserTypeAndSkill> createState() => _UserTypeAndSkillState();
}

class _UserTypeAndSkillState extends State<UserTypeAndSkill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      // width: MediaQuery.of(context).size.width * 0.3,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.blackTextColor),
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              margin: EdgeInsets.only(right: 10.0),
              padding: EdgeInsets.all(5),
              child: Text(
                widget.category.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                ),
              ),
            ),
          ]),
        ),
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "skills".tr().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.blackTextColor),
                    color: CustomColors.backgroundColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  margin: EdgeInsets.only(right: 5.0),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    widget.skill.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                    ),
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}
