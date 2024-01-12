import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kel7/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(LoginInitial()) {
    on<InitUser>(_initUser);
    on<ProsesLogin>(_prosesLogin);
    on<ProsesLogout>(_prosesLogout);
  }
  _initUser(InitUser event, Emitter emit) async {
    emit(LoginLoading());

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sessionToken = prefs.getString('session') ?? "";
    if (sessionToken == "") {
      emit(LoginInitial());
    } else {
      bool result = await userRepository.checkSession(sessionToken);
      if (result == true) {
        emit(LoginSuccess(sessionToken: sessionToken));
      } else {
        emit(LoginInitial());
      }
    }
  }

  _prosesLogout(ProsesLogout event, Emitter emit) async {
    emit(LoginLoading());
    await userRepository.logout();
    emit(LoginInitial());
  }

  _prosesLogin(ProsesLogin event, Emitter emit) async {
    String email = event.email;
    String password = event.password;
    emit(LoginLoading());
    Map res = await userRepository.login(email: email, password: password);
    if (res['status'] == true) {
      emit(LoginSuccess(sessionToken: res['data']['session_token']));
    } else {
      emit(LoginFailure(error: 'User failed'));
    }
  }
}
