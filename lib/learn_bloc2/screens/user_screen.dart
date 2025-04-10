import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_bloc2/bloc/user_bloc.dart';
import 'package:learn_flutter/learn_bloc2/bloc/user_event.dart';

import '../bloc/user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserLoadedState) {
          return RefreshIndicator(
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].name),
                    subtitle: Text(state.users[index].email),
                  );
                },
              ),
              onRefresh: () async {
                context.read<UserBloc>().add(RefreshUserEvent());
              });
        } else if (state is UserErrorState) {
          return Center(child: Text(state.err));
        }
        return Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(RefreshUserEvent());
              },
              child: const Text("Load Users")),
        );
      }),
    );
  }
}
