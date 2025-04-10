import 'package:learn_flutter/learn_cubit/models/UserCubit.dart';

abstract class UserCubitState{}

class UserInitState extends UserCubitState{}


class UserLoadingSate extends UserCubitState{}

class UserLoadedState extends UserCubitState{
  final List<UserCubit> users;

  UserLoadedState(this.users);
}

class UserLoadErrorState extends UserCubitState{
  final String err;

  UserLoadErrorState(this.err);
}