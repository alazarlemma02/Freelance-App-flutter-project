import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/category_dropdown.dart';
import 'package:sira/view/widgets/education_level_dropdown.dart';
import 'package:sira/view/widgets/experience_level_dropdown.dart';
import 'package:sira/view/widgets/skill_dropdown.dart';
import 'package:sira/view/widgets/text_fields.dart';
import 'package:sira/view/widgets/upload_attachment.dart';

class EditProfilePage extends StatefulWidget {
  void Function(String?)? callback;
  String? categoryTxt;
  String? skillTxt;
  String? exprTxt;
  String? educationTxt;
  EditProfilePage(
      {Key? myKey,
      this.categoryTxt,
      this.educationTxt,
      this.exprTxt,
      this.skillTxt,
      this.callback})
      : super(key: myKey);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _profile_tagcont = TextEditingController();
  final _phoneNumberCont = TextEditingController();
  final _socialMediaCont = TextEditingController();
  final _aboutYourselfCont = TextEditingController();
  String? expTxt;
  String? _educationLevelCont;
  String? _experienceLevelCont;

  callBack(category) {
    category = expTxt;
  }

  @override
  Widget build(BuildContext context) {
    context.locale = const Locale('am', 'ETH');
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() {
            Navigator.pushNamed(context, '/MyProfilePage');
          }),
          icon: Icon(
            Icons.arrow_back,
            color: CustomColors.blackTextColor,
          ),
        ),
        title: Text(
          'edit-profile'.tr().toString(),
          style: TextStyle(color: CustomColors.blackTextColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.access_time_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.3,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.07,
                    0,
                    MediaQuery.of(context).size.width * 0.07,
                    0),
                child: Column(children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.height * 0.09,
                              backgroundColor: CustomColors.blackTextColor,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.person_outline,
                                      color: CustomColors.blackTextColor,
                                      size: MediaQuery.of(context).size.height *
                                          0.08,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.089,
                                    backgroundColor:
                                        CustomColors.backgroundColor,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right:
                                          -MediaQuery.of(context).size.height *
                                              0.009,
                                      child: IconButton(
                                        color: CustomColors.blackTextColor,
                                        iconSize:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        icon: Icon(Icons.camera_alt_outlined),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.edit_outlined,
                                size: MediaQuery.of(context).size.height * 0.04,
                                color: CustomColors.blackTextColor,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: Container(
                      child: Column(
                        children: [
                          TextFieldPage(
                              hint_text: 'profile-tag',
                              field_icon: Icons.tag,
                              field_height: 0.03,
                              editingController: _profile_tagcont,
                              maximumLines: 1),
                          CategoryDropDown(
                            callback: callBack,
                            item: widget.categoryTxt.toString(),
                          ),
                          const SkillDropDown(),
                          TextFieldPage(
                              hint_text: 'phone-number',
                              field_icon: Icons.call,
                              field_height: 0.03,
                              editingController: _phoneNumberCont,
                              maximumLines: 1),
                          ExperienceLevelDropDown(
                              expTxt: expTxt.toString(), onSelect: callBack),
                          const EducationLevelDropDown(),
                          TextFieldPage(
                              hint_text: 'social-media',
                              field_icon: Icons.link,
                              field_height: 0.03,
                              editingController: _socialMediaCont,
                              maximumLines: 1),
                          TextFieldPage(
                              hint_text: 'about-yourself',
                              field_icon: Icons.description,
                              field_height: 0.05,
                              editingController: _aboutYourselfCont,
                              maximumLines: 4),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: const UploadAttachment(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: FloatingActionButton(
            backgroundColor: CustomColors.buttonBlueColor,
            onPressed: () {
              try {
                Map<String, dynamic> userData = {
                  "Profile-tag-line": _profile_tagcont.text,
                  "category": widget.categoryTxt,
                  "skill-level": widget.skillTxt,
                  "phone-number": _phoneNumberCont.text,
                  "experience-level": widget.exprTxt,
                  "education-level": widget.educationTxt,
                  "social-media-link": _socialMediaCont.text,
                  "about-yourself": _aboutYourselfCont.text
                };
                FirebaseFirestore.instance
                    .collection('User Full Profile')
                    .doc(_phoneNumberCont.text)
                    .set(userData);
              } catch (e) {
                showSnackBar(e.toString(), Colors.red, context);
              }
            },
            child: Icon(
              Icons.done,
              color: CustomColors.backgroundColor,
            )),
      ),
    );
  }
}
