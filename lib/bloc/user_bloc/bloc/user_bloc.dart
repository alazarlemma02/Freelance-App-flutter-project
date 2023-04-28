import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sira/data/model/user_model.dart';
import 'package:sira/data/services/firebase_api_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _firebaseApiServices = FirebaseApiServices();

  UserBloc() : super(UserInitial()) {
    UserModel user;
    UserModel userFullProfile;
    String? profileImage;
    on<UserFetchEvent>((event, emit) async {
      emit(UserProfileFetchingState());
      user = await _firebaseApiServices.getUser();
      userFullProfile = await _firebaseApiServices.getUserFullProifle();
      emit(UserProfileFetchedState(
          user: user, userFullProfile: userFullProfile));
    });
  }
}
