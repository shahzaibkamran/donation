import 'package:donation/models/login_response.dart';
import 'package:equatable/equatable.dart';

class RegisterBlocState extends Equatable{
  @override
  List<Object?> get props => [];

}

class RegisterBlocInitialState extends RegisterBlocState{}
class RegisterBlocLoadingState extends RegisterBlocState{}
class RegisterBlocFailureState extends RegisterBlocState{
  final LoginResponse loginResponse;
  RegisterBlocFailureState(this.loginResponse);
  @override
  List<Object?> get props => [loginResponse];
}
class RegisterState extends RegisterBlocState{
  final LoginResponse loginResponse;

  RegisterState(this.loginResponse);

  @override
  List<Object?> get props => [loginResponse];
}