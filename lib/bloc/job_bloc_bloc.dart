import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sira/data/services/firebase_api_services.dart';

part 'job_bloc_event.dart';
part 'job_bloc_state.dart';

class JobBlocBloc extends Bloc<JobBlocEvent, JobBlocState> {
  final _firebaseApiServices = FirebaseApiServices();

  JobBlocBloc() : super(JobBlocInitial()) {
    List jobsList;
    on<JobsFetchEvent>((event, emit) async {
      emit(JobListBlocLoadingState());
      jobsList = await _firebaseApiServices.getJobs();
      print(jobsList);
      emit(JobListBlocSuccessState(jobs: jobsList));
    });
  }
}
