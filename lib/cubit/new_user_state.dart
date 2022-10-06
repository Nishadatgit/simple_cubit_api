part of 'new_user_cubit.dart';

abstract class NewUserState {
  const NewUserState();
}

class NewUserLoadingState extends NewUserState {

}

class NewUserLoadedState extends NewUserState {
  final List<UserModel> users;

  const NewUserLoadedState(this.users);
 
}

class NewUserErrorState extends NewUserState {
  final String message;

  const NewUserErrorState(this.message);
  
}
