import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class UserTypeAndSkill extends StatefulWidget {
  const UserTypeAndSkill({super.key});

  @override
  State<UserTypeAndSkill> createState() => _UserTypeAndSkillState();
}

class _UserTypeAndSkillState extends State<UserTypeAndSkill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.4,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: MediaQuery.of(context).size.height * 0.18,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Abebe Kebede',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Designer',
                      style: TextStyle(
                          fontSize: 12, color: CustomColors.blackTextColor),
                    ),
                  ),
                  margin: EdgeInsets.only(right: 20.0),
                  height: MediaQuery.of(context).size.height * 0.026,
                  width: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      color: CustomColors.backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      border: Border.all(
                          color: CustomColors.blackTextColor, width: 1)),
                )
              ]),
        ),
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'skills'.tr().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Designer',
                      style: TextStyle(
                          fontSize: 12, color: CustomColors.blackTextColor),
                    ),
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                  height: MediaQuery.of(context).size.height * 0.026,
                  width: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      color: CustomColors.backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      border: Border.all(
                          color: CustomColors.blackTextColor, width: 1)),
                )
              ]),
        ),
      ]),
    );
  }
}
