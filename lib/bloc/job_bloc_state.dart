part of 'job_bloc_bloc.dart';

@immutable
abstract class JobBlocState {}

class JobBlocInitial extends JobBlocState {}

class JobListBlocLoadingState extends JobBlocState {}

class EmployerJobListBlocSuccessState extends JobBlocState {
  final List jobs;

  EmployerJobListBlocSuccessState({required this.jobs});
}

class EmployerJobSearchListBlocSuccessState extends JobBlocState {
  final List jobs;

  EmployerJobSearchListBlocSuccessState({required this.jobs});
}
