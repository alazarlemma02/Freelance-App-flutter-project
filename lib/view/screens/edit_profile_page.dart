import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/text_fields.dart';
import 'package:sira/view/widgets/upload_attachment.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: CustomColors.blackTextColor,
        ),
        title: Text(
          'Edit Profile',
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
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
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
                                        0.07,
                                  ),
                                  radius: MediaQuery.of(context).size.height *
                                      0.065,
                                  backgroundColor: CustomColors.backgroundColor,
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: -MediaQuery.of(context).size.height *
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
                        const TextFieldPage(
                            hint_text: 'full-name',
                            field_icon: Icons.person_outline,
                            field_height: 0.04),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.04),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                            hintText: 'choose-category'.tr()..toString(),
                            labelStyle: const TextStyle(
                              color: CustomColors.blackTextColor,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                          ),
                        ),
                        const TextFieldPage(
                            hint_text: 'phone-number',
                            field_icon: Icons.call,
                            field_height: 0.04),
                        const TextFieldPage(
                            hint_text: 'email',
                            field_icon: Icons.email,
                            field_height: 0.04),
                        const TextFieldPage(
                            hint_text: 'about-yourself',
                            field_icon: Icons.description,
                            field_height: 0.08),
                      ],
                    ),
                  ),
                ),
                const UploadAttachment(),
                Expanded(
                  child: Container(),
                  flex: 15,
                )
              ]),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: FloatingActionButton(
            backgroundColor: CustomColors.buttonBlueColor,
            onPressed: () {},
            child: Icon(
              Icons.done,
              color: CustomColors.backgroundColor,
            )),
      ),
    );
  }
}
