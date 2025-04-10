import 'package:learn_flutter/learn_bloc2/models/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState(this.users);
}

class UserErrorState extends UserState{
  final String err;

  UserErrorState(this.err);
}