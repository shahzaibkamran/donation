import 'package:bloc/bloc.dart';
import 'package:donation/models/login_response.dart';
import '../../services/api/login_api.dart';
import 'auth_bloc_event.dart';
import 'auth_bloc_state.dart';
import 'dart:async';

class AuthBloc extends Bloc<AuthBlocEvent,AuthBlocState>{
  AuthBloc(AuthBlocState initialState): super(initialState){
    on(eventHandler);
  }

  Future<void> eventHandler(AuthBlocEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthBlocLoadingState());
    if(event is LoginEvent){
      try {
        final loginResponse = await login(event.email, event.password);
        if (loginResponse.status == "ok") {
          emit(LoginState(loginResponse));
        } else {
          emit(AuthBlocFailureState(loginResponse));
        }
      } catch (error) {
        // Handle errors if login function throws an exception
        emit(AuthBlocFailureState(LoginResponse(error: 'An error occurred',status: "400")));
      }
    }
  }
}
