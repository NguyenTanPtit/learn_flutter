import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_cubit/cubit/user_cubit.dart';

import '../cubit/user_cubit_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cubit learning",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: BlocBuilder<UserCubitHandle, UserCubitState>(
        builder: (context, state) {
          if (state is UserLoadingSate) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserInitState) {
            return Center(
              child: ElevatedButton(
                  onPressed: () => context.read<UserCubitHandle>().fetchUser(),
                  child: Text("Load user")),
            );
          } else if (state is UserLoadedState) {
            return RefreshIndicator(
                onRefresh: () async {
                  context.read<UserCubitHandle>().fetchUser();
                },
                child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.users[index].name ?? "Tan dz"),
                      );
                    }));
          } else if (state is UserLoadErrorState) {
            return Center(
              child: Text(state.err),
            );
          }
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<UserCubitHandle>().fetchUser();
                },
                child: Text("Load user list")),
          );
        },
      ),
    );
  }
}
