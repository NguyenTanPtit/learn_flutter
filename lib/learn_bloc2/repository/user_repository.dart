import 'package:learn_flutter/learn_bloc2/models/user.dart';

class UserRepository{

  Future<List<User>> fetchUser() async{
    await Future.delayed(Duration(seconds: 2));
    return [
      User("Nguyen Tan", "email@gmail.com"),
      User("Test1", "email1@gmail.com"),
      User("Test2", "email2@gmail.com")
    ];
  }
}