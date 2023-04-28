part of 'applicants_bloc.dart';

@immutable
abstract class ApplicantsState {}

class ApplicantsInitial extends ApplicantsState {}

class ApplicantsLoading extends ApplicantsState {}

class ApplicantsSuccess extends ApplicantsState {
  final List applicants;
  final List applicantProfile;

  ApplicantsSuccess({required this.applicants, required this.applicantProfile});
}
