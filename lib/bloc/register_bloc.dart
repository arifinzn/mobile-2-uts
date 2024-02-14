import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kel7/repositories/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterInitial()) {
    on<InitRegister>(_initRegister);
    on<ProsesRegister>(_prosesRegister);
  }

  _initRegister(InitRegister event, Emitter emit) async {
    emit(RegisterInitial());
  }

  _prosesRegister(ProsesRegister event, Emitter emit) async {
    String npm = event.npm;
    String name = event.name;
    String email = event.email;
    String phone = event.phone;
    String password = event.password;
    emit(RegisterLoading());
    Map res = await userRepository.register(
        npm: npm, name: name, email: email, phone: phone, password: password);
    if (res['status'] == true) {
      emit(RegisterSuccess(sessionToken: res['data']['session_token']));
    } else {
      // emit(RegisterFailure(error: res['data']['pesan']));
      emit(RegisterFailure(error: 'pesan'));
    }
  }
}
