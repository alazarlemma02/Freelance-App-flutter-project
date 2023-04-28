import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/model/user_model.dart';

class ApplicantCard extends StatelessWidget {
  final String applicantName;
  final String applicantCategory;
  final String applicantBio;
  final String applicantPhoneNumber;
  final String applicantEmail;
  final String profileImage;

  const ApplicantCard(
      {super.key,
      required this.applicantName,
      required this.applicantCategory,
      required this.applicantBio,
      required this.applicantPhoneNumber,
      required this.applicantEmail,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(
        fullName: applicantName,
        aboutYourself: applicantBio,
        phoneNumber: applicantPhoneNumber,
        email: applicantEmail,
        profileImage: profileImage);

    return InkWell(
      onTap: () {
        BlocProvider.of<JobBlocBloc>(context).add(PostedJobsFetchEvent());
        Navigator.pushNamed(
          context,
          '/ApplicantProfilePage',
          arguments: {
            'user': user,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: CustomColors.cardColor,
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  child: Image(
                    image: NetworkImage(profileImage.toString()),
                    width: 50,
                    height: 50,
                  ),
                  width: 50,
                  height: 50,
                  color: CustomColors.backgroundColor,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicantName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Bid",
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 12,
                              color: CustomColors.goldenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.blackTextColor),
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Text(
                  applicantCategory,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
