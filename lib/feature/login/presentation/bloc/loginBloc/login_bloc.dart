import 'package:bloc/bloc.dart';
import 'package:e_member_app/core/constants/pref_keys.dart';
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
        // Save fields separately
  // await prefs.setString('clientid', user.data.first.clientid); // Clientid
  // await prefs.setString('userid', user.data.first.id);        // normal id
  // await prefs.setString('username', user.data.first.name);    // name
  // await prefs.setString('mobile', user.data.first.mobile);  
        

         await prefs.setString(
            PrefKeys.clientId, user.data.first.clientid);
        await prefs.setString(
            PrefKeys.userId, user.data.first.id);
        await prefs.setString(
            PrefKeys.userName, user.data.first.name);
        await prefs.setString(
            PrefKeys.mobile, user.data.first.mobile);

 await prefs.setString(
  PrefKeys.ward,
  user.data.first.ward,
);

await prefs.setString(
  PrefKeys.photo,
  user.data.first.photo ,
);


            
        // print("Saved clientid: ${user.data.first.clientid}");
        // print("Saved userid: ${user.data.first.id}");
        // print("Saved username: ${user.data.first.name}"); 
        // print("Saved mobile: ${user.data.first.mobile}");

        emit(LoginSuccess(user: user));
      } else {
        emit(LoginFailure(message: "Invalid credentials"));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}