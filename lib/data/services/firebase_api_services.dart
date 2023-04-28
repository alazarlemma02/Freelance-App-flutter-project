import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sira/data/model/job.dart';
import 'package:sira/data/model/job_application.dart';
import 'package:sira/data/model/user_model.dart';
import 'package:sira/data/services/firebase_authentication.dart';

class FirebaseApiServices {
  String? userType;

  void setUserType(String? user) {
    userType = user;
  }

  void initUserType() async {
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setUserType(userDoc.get('userType').toString());
    } catch (e) {
      print(e.toString());
    }
  }

  String? getUserType() {
    return userType;
  }

  Future getJobsByPoster() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    final userId = user!.uid;

    var jobs = await FirebaseFirestore.instance
        .collection('Jobs')
        .where("posted-by", isEqualTo: userId)
        .get();

    return List.from(jobs.docs.map((doc) => Job.fromSnapshot(doc)));
  }

  Future getFilteredJobs(String searchVal) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    final userId = user!.uid;

    var jobs = await FirebaseFirestore.instance
        .collection('Jobs')
        .where("posted-by", isEqualTo: userId)
        .where('job-title', isGreaterThanOrEqualTo: searchVal)
        .get();

    return List.from(jobs.docs.map((doc) => Job.fromSnapshot(doc)));
  }

  Future getJobs() async {
    var jobs = await FirebaseFirestore.instance.collection('Jobs').get();

    return List.from(jobs.docs.map((doc) => Job.fromSnapshot(doc)));
  }

  Future getUser() async {
    var currentUser = await FirebaseAuth.instance.currentUser!.email;
    var user = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser)
        .get();

    return UserModel.fromSnapshot(user);
  }

  Future<UserModel> getUserById(String userEmail) async {
    var user = await FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .get();

    return UserModel.fromSnapshot(user);
  }

  Future<UserModel> getUserProfileById(String userEmail) async {
    var user = await FirebaseFirestore.instance
        .collection('User Full Profile')
        .doc(userEmail)
        .get();

    return UserModel.fromSnapshot(user);
  }

  Future getUserFullProifle() async {
    var currentUser = await FirebaseAuth.instance.currentUser!.email;
    var user = await FirebaseFirestore.instance
        .collection('User Full Profile')
        .doc(currentUser)
        .get();

    return UserModel.fromSnapshot(user);
  }

  Future getAllFilteredJobs(String searchVal) async {
    var jobs = await FirebaseFirestore.instance
        .collection('Jobs')
        .where('job-title', isGreaterThanOrEqualTo: searchVal)
        .get();

    return List.from(jobs.docs.map((doc) => Job.fromSnapshot(doc)));
  }

  Future<Job> getJobById(String jobId) async {
    var job =
        await FirebaseFirestore.instance.collection('Jobs').doc(jobId).get();

    return Job.fromSnapshot(job);
  }

  Future getJobApplicants(String jobId) async {
    var applicants = [];

    var applicantions = await FirebaseFirestore.instance
        .collection('Job Applications')
        .where('job-id', isEqualTo: jobId)
        .get();

    var applicantIds =
        List.from(applicantions.docs.map((doc) => doc.data()['applicant-id']));

    for (var a in applicantIds) {
      applicants.add(await getUserById(a));
    }
    return applicants;
  }

  Future getJobApplicantsProfile(String jobId) async {
    var applicantProfile = [];

    var applicantions = await FirebaseFirestore.instance
        .collection('Job Applications')
        .where('job-id', isEqualTo: jobId)
        .get();

    var applicantIds =
        List.from(applicantions.docs.map((doc) => doc.data()['applicant-id']));

    for (var a in applicantIds) {
      applicantProfile.add(await getUserProfileById(a));
    }
    return applicantProfile;
  }
}
