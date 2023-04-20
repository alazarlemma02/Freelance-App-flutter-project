import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sira/data/model/job.dart';

CollectionReference jobCollectionReference =
    FirebaseFirestore.instance.collection('Jobs');

class FirebaseApiServices {
  Future<List> getJobs() async {
    QuerySnapshot querySnapshot = await jobCollectionReference
        .orderBy(
          'application-deadline',
          descending: true,
        )
        .get();
    final allJobs = querySnapshot.docs.map((doc) => doc.data()).toString();
    return Job.jobsList(json.decode(allJobs));
  }
}
