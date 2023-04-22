// part of 'job_bloc_bloc.dart';


@immutable
abstract class JobBlocEvent extends Equatable {
  const JobBlocEvent();

  @override
  List<Object> get props => [];
}

class JobsFetchEvent extends JobBlocEvent {
  const JobsFetchEvent();

  @override
  List<Object> get props => [];
  
}

