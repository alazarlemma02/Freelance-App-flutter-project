part of 'job_bloc_bloc.dart';

@immutable
abstract class JobBlocState {}

class JobBlocInitial extends JobBlocState {}

class JobListBlocLoadingState extends JobBlocState {}

class JobListBlocSuccessState extends JobBlocState {
  final List jobs;

  JobListBlocSuccessState({required this.jobs});
}

class JobSearchListBlocSuccessState extends JobBlocState {
  final List jobs;

  JobSearchListBlocSuccessState({required this.jobs});
}
