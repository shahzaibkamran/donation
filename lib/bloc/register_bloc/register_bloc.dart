import 'package:bloc/bloc.dart';
import 'package:donation/models/login_response.dart';
import 'package:donation/services/api/register_api.dart';
import 'dart:async';
import 'register_bloc_event.dart';
import 'register_bloc_state.dart';

class RegisterBloc extends Bloc<RegisterBlocEvent,RegisterBlocState>{
  RegisterBloc(RegisterBlocState initialState): super(initialState){
    on(eventHandler);
  }

  Future<void> eventHandler(RegisterBlocEvent event, Emitter<RegisterBlocState> emit) async {
    emit(RegisterBlocLoadingState());
    if(event is RegisterEvent){
      try {
        final loginResponse = await register(event.email, event.password,event.firstName,event.lastName,event.phoneNumber);
        if (loginResponse.status == "ok") {
          emit(RegisterState(loginResponse));
        } else {
          emit(RegisterBlocFailureState(loginResponse));
        }
      } catch (error) {
        emit(RegisterBlocFailureState(LoginResponse(error: 'An error occurred',status: "400")));
      }
    }
  }
}
