import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class UserProfilePicture extends StatefulWidget {
  String? profileImage;
  UserProfilePicture({super.key, required this.profileImage});

  @override
  State<UserProfilePicture> createState() => _UserProfilePictureState();
}

class _UserProfilePictureState extends State<UserProfilePicture> {
  @override
  Widget build(BuildContext context) {
    print(widget.profileImage.toString());
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundColor: CustomColors.blackTextColor,
          radius: MediaQuery.of(context).size.height * 0.08,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.profileImage.toString()),
            backgroundColor: CustomColors.backgroundColor,
            radius: MediaQuery.of(context).size.height * 0.076,
          ),
        ),
      ),
    );
  }
}
