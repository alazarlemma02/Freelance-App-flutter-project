part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserProfileFetchingState extends UserState {}

class UserProfileFetchedState extends UserState {
  UserModel? user;
  UserModel? userFullProfile;
  UserProfileFetchedState({this.user, this.userFullProfile});
}
