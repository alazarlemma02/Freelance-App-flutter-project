import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class UserProfilePicture extends StatefulWidget {
  const UserProfilePicture({super.key});

  @override
  State<UserProfilePicture> createState() => _UserProfilePictureState();
}

class _UserProfilePictureState extends State<UserProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundColor: CustomColors.blackTextColor,
          radius: MediaQuery.of(context).size.height * 0.08,
          child: CircleAvatar(
            backgroundColor: CustomColors.backgroundColor,
            radius: MediaQuery.of(context).size.height * 0.076,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child: Container(
                  child: Icon(
                    Icons.person_outline,
                    size: MediaQuery.of(context).size.height * 0.09,
                    color: CustomColors.blackTextColor,
                  ),

                  /// replace your image with the Icon
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
