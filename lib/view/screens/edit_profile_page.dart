// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sira/bloc/user_bloc/bloc/user_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/model/user_model.dart';
import 'package:sira/main.dart';
import 'package:sira/view/screens/my_profile.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/category_dropdown.dart';
import 'package:sira/view/widgets/education_level_dropdown.dart';
import 'package:sira/view/widgets/experience_level_dropdown.dart';
import 'package:sira/view/widgets/skill_dropdown.dart';
import 'package:sira/view/widgets/text_fields.dart';
import 'package:sira/view/widgets/upload_attachment.dart';

import '../widgets/crop_image.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _profile_tagcont = TextEditingController();
  final _phoneNumberCont = TextEditingController();
  final _socialMediaCont = TextEditingController();
  final _aboutYourselfCont = TextEditingController();
  String? categroyTxt;
  String? expTxt;
  String? skillTxt;
  String? educationLevelTxt;
  List<File> imageFileList = [];
  File? attachment;

  callbackCategory(categoryChoice) {
    setState(() {
      categroyTxt = categoryChoice;
    });
  }

  callbackExperience(categoryChoice) {
    setState(() {
      expTxt = categoryChoice;
    });
  }

  callbackSkill(categoryChoice) {
    setState(() {
      skillTxt = categoryChoice;
    });
  }

  callbackEducationLevel(categoryChoice) {
    setState(() {
      educationLevelTxt = categoryChoice;
    });
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        attachment = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    context.locale = const Locale('en', 'US');

    ImageProvider image = const AssetImage(
      "assets/images/Tie.png",
    );

    if (imageFileList.isNotEmpty) {
      image = FileImage(imageFileList[imageFileList.length - 1]);
    }

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() {
            Navigator.pushNamed(context, '/MyProfilePage');
          }),
          icon: const Icon(
            Icons.arrow_back,
            color: CustomColors.blackTextColor,
          ),
        ),
        title: Text(
          'edit-profile'.tr().toString(),
          style: const TextStyle(color: CustomColors.blackTextColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.access_time_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            onPressed: () {},
            icon: const Icon(
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
                                    backgroundImage: image,
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
                                        onPressed: () {
                                          _showSelectionDialog(context);
                                        },
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
                              hint_text: "profile-tag".tr().toString(),
                              field_icon: Icons.tag,
                              field_height: 0.03,
                              editingController: _profile_tagcont,
                              maximumLines: 1),
                          CategoryDropDown(
                              item: categroyTxt.toString(),
                              callbackFunction: callbackCategory),
                          SkillDropDown(
                            item: skillTxt.toString(),
                            callbackFunction: callbackSkill,
                          ),
                          TextFieldPage(
                              hint_text: "phone-number".tr().toString(),
                              field_icon: Icons.call,
                              field_height: 0.03,
                              editingController: _phoneNumberCont,
                              maximumLines: 1),
                          ExperienceLevelDropDown(
                              item: expTxt.toString(),
                              callbackFunction: callbackExperience),
                          EducationLevelDropDown(
                            item: educationLevelTxt,
                            callbackFunction: callbackEducationLevel,
                          ),
                          TextFieldPage(
                              hint_text: "social-media".tr().toString(),
                              field_icon: Icons.link,
                              field_height: 0.03,
                              editingController: _socialMediaCont,
                              maximumLines: 1),
                          TextFieldPage(
                              hint_text: "about-yourself".tr().toString(),
                              field_icon: Icons.description,
                              field_height: 0.05,
                              editingController: _aboutYourselfCont,
                              maximumLines: 4),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: UploadAttachment(setAttachment: selectFile),
                          // ),
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
            onPressed: () async {
              try {
                String imageUrl =
                    await uploadImageToFirebaseStorage(imageFileList[0]);
                // String attachmentUrl =
                //     await uploadFileToFirebaseStorage(attachment!);

                UserModel userData = UserModel(
                    profileTagLine: _profile_tagcont.text,
                    category: categroyTxt,
                    skillLevel: skillTxt,
                    phoneNumber: _phoneNumberCont.text,
                    experienceLevel: expTxt,
                    educationLevel: educationLevelTxt,
                    socialMediaLink: _socialMediaCont.text,
                    aboutYourself: _aboutYourselfCont.text,
                    profileImage: imageUrl,
                    attachmentUrl: '');

                FirebaseFirestore.instance
                    .collection('User Full Profile')
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .set(userData.toJson());
                showSnackBar("Your profile is successfully updated",
                    Colors.green, context);
                Navigator.pushNamed(context, '/MyProfilePage');
                BlocProvider.of<UserBloc>(context).add(const UserFetchEvent());
                //TODO: Navigate to the profile page

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

  /// Selection dialog that prompts the user to select an existing photo or take a new one
  Future _showSelectionDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("select-photo".tr().toString()),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("from-gallery".tr().toString()),
              onPressed: () {
                selectImages();
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: Text("take-a-photo".tr().toString()),
              onPressed: () {
                takeImages();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // a method to pick photos from a gallery.
  final ImagePicker imagePicker = ImagePicker();
  Future selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      File file = File(selectedImages[0].path);
      // crop image starts here.
      var croppedImage = await CropTheImage.cropImage(file);
      if (croppedImage == null) {
        return;
      }
      File imageFile = File(croppedImage.path);
      imageFileList.add(imageFile);
      // crop image ends here.
    }
    setState(() {});
  }

  // a method to pick photos from a camera
  Future takeImages() async {
    final XFile? selectedImages = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (selectedImages != null) {
      File file = File(selectedImages.path);
      // crop image starts here.
      var croppedImage = await CropTheImage.cropImage(file);
      if (croppedImage == null) {
        return;
      }
      File imageFile = File(croppedImage.path);
      imageFileList.add(imageFile);
      // crop image ends here.
    }
    setState(() {});
  }

  // This function is used to upload an image to the firebase storage and get the url
  Future<String> uploadImageToFirebaseStorage(File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference =
        storage.ref().child('user_profile/${file.path}');
    UploadTask uploadTask = storageReference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // This function is used to upload a file to the firebase storage and get the url
  Future<String> uploadFileToFirebaseStorage(File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference = storage.ref().child('user_files/${file.path}');
    UploadTask uploadTask = storageReference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
