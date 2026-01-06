import 'package:bloc/bloc.dart';
import 'package:e_member_app/feature/login/data/repository/login_repository.dart';

import 'package:e_member_app/feature/login/data/model/usermodel.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginPressed);
  }

  Future<void> _onLoginPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final user = await repository.login(event.email, event.password);

      if (user.status == "true") {
        // Save Clientid
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('clientid', user.data.first.clientid);
        
        print("Saved clientid: ${user.data.first.clientid}");

        emit(LoginSuccess(user: user));
      } else {
        emit(LoginFailure(message: "Invalid credentials"));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
