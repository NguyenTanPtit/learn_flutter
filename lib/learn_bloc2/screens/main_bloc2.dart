import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_bloc2/bloc/user_bloc.dart';
import 'package:learn_flutter/learn_bloc2/screens/user_screen.dart';

import '../repository/user_repository.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final userRepository = UserRepository();

  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (context) => UserBloc(userRepository),
      child: UserPage(),),
    );
  }
}