import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sira/data/model/user_model.dart';
import 'package:sira/data/services/firebase_api_services.dart';

part 'applicants_event.dart';
part 'applicants_state.dart';

class ApplicantsBloc extends Bloc<ApplicantsEvent, ApplicantsState> {
  final _firebaseApiServices = FirebaseApiServices();

  ApplicantsBloc() : super(ApplicantsInitial()) {
    List applicantList = [];

    on<FetchApplicants>((event, emit) async {
      emit(ApplicantsLoading());
      applicantList = await _firebaseApiServices.getJobApplicants(event.jobId);
      emit(ApplicantsSuccess(applicants: applicantList));
    });
  }
}
