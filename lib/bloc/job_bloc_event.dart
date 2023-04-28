part of 'job_bloc_bloc.dart';

@immutable
abstract class JobBlocEvent extends Equatable {
  const JobBlocEvent();

  @override
  List<Object> get props => [];
}

class PostedJobsFetchEvent extends JobBlocEvent {
  const PostedJobsFetchEvent();

  @override
  List<Object> get props => [];
}

class SearchedJobsFetchEvent extends JobBlocEvent {
  final String searchVal;
  const SearchedJobsFetchEvent({required this.searchVal});

  @override
  List<Object> get props => [];
}

class AvailableJobsFetchEvent extends JobBlocEvent {
  const AvailableJobsFetchEvent();

  @override
  List<Object> get props => [];
}

class AvailableSearchedJobsFetchEvent extends JobBlocEvent {
  final String searchVal;
  const AvailableSearchedJobsFetchEvent({required this.searchVal});

  @override
  List<Object> get props => [];
}

class LoadJobDetailEvent extends JobBlocEvent {
  final String jobId;
  const LoadJobDetailEvent({required this.jobId});

  @override
  List<Object> get props => [];
}
