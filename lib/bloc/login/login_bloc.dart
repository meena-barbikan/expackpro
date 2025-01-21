import 'package:expackpro/bloc/login/login_event.dart';
import 'package:expackpro/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitlalize()) {
    on<LoginSumbitted>((event, emit) => _onsubmittedevent(event, emit));
  }

  _onsubmittedevent(LoginSumbitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await Future.delayed(Duration(seconds: 2));
      if (event.username == "admin" && event.password == "123") {
        emit(LoginSuccess(message: "Login Successfully"));
      } else {
        emit(LoginFailed(error: "Invalid UserName and Password"));
      }
    } catch (e) {
      emit(LoginFailed(error: "An error occured $e"));
    }
  }
}
