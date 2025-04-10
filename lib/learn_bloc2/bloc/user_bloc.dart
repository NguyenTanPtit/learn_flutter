import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_bloc2/bloc/user_event.dart';
import 'package:learn_flutter/learn_bloc2/bloc/user_state.dart';

import '../repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository repository;

  UserBloc(this.repository): super(UserInitialState()){
    on<FetchUserEvent>((event,emit){
      _onFetchUserEvent(event, emit);
    });

    on<RefreshUserEvent>((event,emit){
      _onFetchUserEvent(event, emit);
    });
  }

  Future<void> _onFetchUserEvent(UserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try{
      final users = await repository.fetchUser().whenComplete(() => emit(UserLoadedState(users)));
      emit(UserLoadedState(users));
    }catch(e){
      emit(UserErrorState(e.toString()));
    }
  }
}