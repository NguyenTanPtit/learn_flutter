import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_cubit/cubit/user_cubit_state.dart';
import 'package:learn_flutter/learn_cubit/models/UserCubit.dart';

class UserCubitHandle extends Cubit<UserCubitState>{
    UserCubitHandle(): super(UserInitState());

    Future<void> fetchUser() async{
      emit(UserLoadingSate());

      try{
        await Future.delayed(Duration(seconds: 2));
        final users = List.generate(5,(index)=> UserCubit("Username: $index"));
        
        emit(UserLoadedState(users));
      }catch(e){
        emit(UserLoadErrorState(e.toString()));
      }
    }

}