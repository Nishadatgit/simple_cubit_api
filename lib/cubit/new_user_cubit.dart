import 'package:bloc/bloc.dart';
import 'package:cubit_equatable/models/user_model.dart';
import 'package:cubit_equatable/repository/repositories.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit(this._userRepository) : super(NewUserLoadingState());

  final UserRepository _userRepository;

  void loadUser() async {
    emit(NewUserLoadingState());
    try {
      final users = await _userRepository.fetchUsers();
      emit(NewUserLoadedState(users));
    } catch (e) {
      emit(NewUserErrorState(e.toString()));
    }
  }
}
