import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/signup_page.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/sira_logo.dart';

class PathPage extends StatefulWidget {
  PathPage({super.key});

  @override
  State<PathPage> createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  String pathGroup = 'Freelancer';
  String? userType;
  Color borderColors = CustomColors.buttonBlueColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: CustomColors.blackTextColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      )),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const SiraLogo(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    'I-am'.tr().toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: CustomColors.blackTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    'Pick-one'.tr().toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CustomColors.fadedTextColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PathCard(
                          iconName: Icons.person,
                          title: "freelancer".tr().toString(),
                          subTitle: "looking-for-work".tr().toString(),
                        ),
                        Radio(
                            activeColor: CustomColors.buttonBlueColor,
                            value: "Freelancer",
                            groupValue: pathGroup,
                            onChanged: (value) {
                              setState(() {
                                userType = value;
                                pathGroup = value.toString();
                              });
                            }),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      PathCard(
                        iconName: Icons.apartment,
                        title: "employer".tr().toString(),
                        subTitle: "looking-to-hire".tr().toString(),
                      ),
                      Radio(
                          activeColor: CustomColors.buttonBlueColor,
                          value: "Employer",
                          groupValue: pathGroup,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                              pathGroup = value.toString();
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    40,
                  ),
                  backgroundColor: CustomColors.buttonBlueColor),
              onPressed: () {
                userType = pathGroup;
                Navigator.pushNamed(context, '/SignUpPage',
                    arguments: SignUpPage(
                      userType: userType,
                    ));
              },
              child: Text(
                'continue'.tr().toString(),
                style: const TextStyle(
                  color: CustomColors.backgroundColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PathCard extends StatelessWidget {
  IconData iconName;
  String title;
  String subTitle;

  PathCard({
    super.key,
    required this.iconName,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: CustomColors.blackTextColor),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Icon(
              iconName,
              size: 50,
              color: CustomColors.blackTextColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  '$title'.tr().toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: CustomColors.blackTextColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  '$subTitle'.tr().toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CustomColors.fadedTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
