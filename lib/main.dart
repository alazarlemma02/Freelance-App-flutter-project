import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sira/bloc/applicants_bloc/bloc/applicants_bloc.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/bloc/user_bloc/bloc/user_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/services/firebase_api_services.dart';
import 'package:sira/data/services/firebase_authentication.dart';
import 'package:sira/view/screens/add_job_page.dart';
import 'package:sira/view/screens/applicant_profile_page.dart';
import 'package:sira/view/screens/avilable_jobs_page.dart';
import 'package:sira/view/screens/category_page.dart';
import 'package:sira/view/screens/edit_profile_page.dart';
import 'package:sira/view/screens/forgot_password_page.dart';
import 'package:sira/view/screens/job_application_page.dart';
import 'package:sira/view/screens/job_detail_page.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/screens/my_profile.dart';
import 'package:sira/view/screens/ongoing_jobs_page.dart';
import 'package:sira/view/screens/path_page.dart';
import 'package:sira/view/screens/posted_jobs_page.dart';
import 'package:sira/view/screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sira/firebase_options.dart';
import 'package:sira/view/widgets/logout_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('am', "ETH"),
    ],
    path: 'assets/translations',
    saveLocale: true,
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  String? route;
  bool isLoggedIn = false;

  checkIfLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLoggedIn = true;
          route = prefs.getString('userRoute');
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JobBlocBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ApplicantsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? route : '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/SignUpPage': (context) => SignUpPage(),
          '/PathPage': (context) => PathPage(),
          '/CategoryPage': (context) => const Category_page(),
          '/PostedJobs': (context) => const PostedJobs(),
          '/AddJobPage': (context) => const AddJob(),
          '/JobDetailPage': (context) => const JobDetailPage(),
          '/ApplicantProfilePage': (context) => const Applicantprofile(),
          '/AvailableJobs': (context) => const AvailableJobs(),
          '/JobApplicationpage': (context) => const JobApplicationpage(),
          '/OngoingJobs': (context) => const OngoingJobs(),
          '/MyProfilePage': (context) => const MyProfile(),
          '/EditProfilePage': (context) => EditProfilePage(),
          '/ForgotPasswordPage': (context) => const ForgotPasswordPage(),
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
