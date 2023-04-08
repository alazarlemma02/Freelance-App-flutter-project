import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/add_job_page.dart';
import 'package:sira/view/screens/avilable_jobs_page.dart';
import 'package:sira/view/screens/ongoing_jobs_page.dart';
import 'package:sira/view/screens/posted_jobs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // initialRoute: '/AvailableJobs',
      routes: {
        '/': (context) => const PostedJobs(),
        '/AvailableJobs': (context) => const AvailableJobs(),
        '/OngoingJobs': (context) => const OngoingJobs(),
        '/AddJob': (context) => const AddJob()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: CustomColors.blackTextColor),
        drawerTheme: DrawerThemeData(
          backgroundColor: CustomColors.backgroundColor,
        ),
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.transparentColor,
          elevation: 0,
          foregroundColor: CustomColors.blackTextColor,
          toolbarHeight: 70,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: CustomColors.buttonBlueColor,
        ),
        primaryColor: CustomColors.buttonBlueColor,
        fontFamily: 'OpenSans',
      ),
    );
  }
}
