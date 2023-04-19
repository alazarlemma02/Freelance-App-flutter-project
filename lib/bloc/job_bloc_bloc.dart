import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'job_bloc_event.dart';
part 'job_bloc_state.dart';

class JobBlocBloc extends Bloc<JobBlocEvent, JobBlocState> {
  JobBlocBloc() : super(JobBlocInitial()) {
    on<JobBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
