import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_cubit/cubit/user_cubit.dart';
import 'package:learn_flutter/learn_cubit/screens/user_cubit_screens.dart';

void main(){
  runApp(
    MaterialApp(
      home: BlocProvider(create: (context)=> UserCubitHandle(),
      child: UserPage(),),
    )
  );
}