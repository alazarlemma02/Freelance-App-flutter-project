part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserFetchEvent extends UserEvent {
  const UserFetchEvent();

  @override
  List<Object> get props => [];
}
