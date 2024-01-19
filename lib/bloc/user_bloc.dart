import 'package:bloc/bloc.dart';
import 'package:kel7/models/user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kel7/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<InitUser>(_initUser);
  }

  _initUser(InitUser event, Emitter emit) async {
    emit(UserLoading());
    User? res = await userRepository.getUserInfo();
    if (res != null) {
      emit(UserData(res));
    } else {
      emit(UserFailure(error: 'failed'));
    }
  }
}
