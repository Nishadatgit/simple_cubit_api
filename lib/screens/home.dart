import 'package:cubit_equatable/cubit/new_user_cubit.dart';
import 'package:cubit_equatable/repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text("Users"),
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NewUserCubit>(context).loadUser();
                  },
                  icon: const Icon(Icons.replay))
            ],
          ),
          body: BlocBuilder<NewUserCubit, NewUserState>(
            builder: (context, state) {
              if (state is NewUserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewUserLoadedState) {
                final users = state.users;

                return ListView.builder(
                  itemBuilder: (ctx, index) {
                    final user = users[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text(user.firstName),
                        subtitle: Text(user.email),
                      ),
                    );
                  },
                  itemCount: users.length,
                );
              } else if (state is NewUserErrorState) {
                Text(state.message);
              }
              return const Center(child: Text("Something went wrong"));
            },
          
        ));
  }
}
