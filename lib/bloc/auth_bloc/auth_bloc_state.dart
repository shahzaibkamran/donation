import 'package:donation/models/login_response.dart';
import 'package:equatable/equatable.dart';

class AuthBlocState extends Equatable{
  @override
  List<Object?> get props => [];

}

class AuthBlocInitialState extends AuthBlocState{}
class AuthBlocLoadingState extends AuthBlocState{}
class AuthBlocFailureState extends AuthBlocState{
  final LoginResponse loginResponse;
  AuthBlocFailureState(this.loginResponse);
  @override
  List<Object?> get props => [loginResponse];
}
class LoginState extends AuthBlocState{
  final LoginResponse loginResponse;

  LoginState(this.loginResponse);

  @override
  List<Object?> get props => [loginResponse];
}