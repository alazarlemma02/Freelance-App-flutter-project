import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/widgets/drawer.dart';
import 'package:sira/view/widgets/job_card_widget.dart';
import 'package:sira/view/widgets/logout_page.dart';

class AvailableJobs extends StatefulWidget {
  const AvailableJobs({super.key});

  @override
  State<AvailableJobs> createState() => _AvailableJobsState();
}

class _AvailableJobsState extends State<AvailableJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/OngoingJobs'),
            },
            icon: Icon(
              Icons.watch,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/EditProfilePage'),
            },
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
        title: Text('available-jobs'.tr().toString()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              color: CustomColors.cardColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  style: TextStyle(
                    color: CustomColors.fadedTextColor,
                    // fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'search'.tr().toString(),
                    icon: Icon(
                      Icons.search_outlined,
                      size: 24,
                      color: CustomColors.blackTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              children: [
                // JobCard(
                //   parentPage: "available jobs",
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
