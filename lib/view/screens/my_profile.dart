import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/bloc/user_bloc/bloc/user_bloc.dart';

import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/attachments.dart';
import 'package:sira/view/widgets/contact_detail.dart';
import 'package:sira/view/widgets/user_profile.dart';
import 'package:sira/view/widgets/user_type_skil.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _My_profileState();
}

class _My_profileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          BlocProvider.of<UserBloc>(context).add(const UserFetchEvent());
        }
        if (state is UserProfileFetchingState) {
          return Scaffold(
            backgroundColor: CustomColors.backgroundColor,
            body: Center(
                child: CircularProgressIndicator(
              color: CustomColors.buttonBlueColor,
            )),
          );
        }
        if (state is UserProfileFetchedState) {
          return Scaffold(
            backgroundColor: CustomColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: CustomColors.transparentColor,
              elevation: 0,
              leading: IconButton(
                onPressed: (() async {
                  String? userType;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  userType = prefs.getString('userType');
                  if (userType == "Freelancer") {
                    BlocProvider.of<JobBlocBloc>(context)
                        .add(const AvailableJobsFetchEvent());
                    await Navigator.pushNamed(context, '/AvailableJobs');
                  } else {
                    BlocProvider.of<JobBlocBloc>(context)
                        .add(const PostedJobsFetchEvent());
                    await Navigator.pushNamed(context, '/PostedJobs');
                  }
                }),
                icon: Icon(
                  Icons.arrow_back,
                ),
                color: CustomColors.blackTextColor,
              ),
              title: Text(state.user!.fullName.toString(),
                  style: TextStyle(color: CustomColors.blackTextColor)),
              actions: [
                IconButton(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05),
                  onPressed: () {},
                  icon: Icon(Icons.access_time_rounded,
                      color: CustomColors.blackTextColor),
                ),
                IconButton(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05),
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined,
                      color: CustomColors.blackTextColor),
                ),
                IconButton(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.08),
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_outlined,
                    color: CustomColors.blackTextColor,
                  ),
                ),
              ],
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: CustomColors.backgroundColor,
                  child: Column(
                    children: [
                      Stack(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                ),

                                ///here we create space for the circle avatar to get ut of the box
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: CustomColors.cardColor,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: Column(
                                    children: [
                                      UserTypeAndSkill(
                                        fullName:
                                            state.user!.fullName.toString(),
                                        category: state
                                            .userFullProfile!.category
                                            .toString(),
                                        skill: state.userFullProfile!.skillLevel
                                            .toString(),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: ListView(
                                          children: [
                                            Text(
                                              state.userFullProfile!
                                                  .aboutYourself
                                                  .toString(),
                                              style: TextStyle(
                                                  color: CustomColors
                                                      .blackTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: AttachmentFile(
                                          attachment: state
                                              .userFullProfile!.attachmentUrl,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              UserProfilePicture(
                                profileImage:
                                    state.userFullProfile!.profileImage,
                              ),

                              ///Image Avatar
                            ],
                          ),
                        ),
                      ]),
                      Container(
                        padding: EdgeInsets.only(right: 220),
                        child: Text(
                          'contact-details'.tr().toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ContactDetail(
                          email: state.user!.email,
                          phoneNumber: state.userFullProfile!.phoneNumber,
                          socialMedia: state.userFullProfile!.socialMediaLink),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EditProfilePage');
              },
              child: Center(
                  child: Icon(
                Icons.edit,
                color: CustomColors.backgroundColor,
              )),
              backgroundColor: CustomColors.buttonBlueColor,
            ),
          );
        }
        return Container(
          child: Center(
            child: Text(
              'Some Error Ocurred',
              style: TextStyle(color: CustomColors.blackTextColor),
            ),
          ),
        );
      },
    );
  }
}
