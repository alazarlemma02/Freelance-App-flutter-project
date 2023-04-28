part of 'applicants_bloc.dart';

abstract class ApplicantsEvent extends Equatable {
  const ApplicantsEvent();

  @override
  List<Object> get props => [];
}

class FetchApplicants extends ApplicantsEvent {
  final String jobId;

  const FetchApplicants({required this.jobId});
}
