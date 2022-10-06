import 'package:cubit_equatable/cubit/new_user_cubit.dart';
import 'package:cubit_equatable/repository/repositories.dart';
import 'package:cubit_equatable/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(RepositoryProvider( create: (context)=>UserRepository(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewUserCubit>(
       create: (context) =>
            NewUserCubit(RepositoryProvider.of<UserRepository>(context))
              ..loadUser(),
      child: MaterialApp(
        theme: ThemeData(),
        home: const HomeScreen(),
      ),
    );
  }
}
