import 'package:equatable/equatable.dart';

class RegisterBlocEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class RegisterEvent extends RegisterBlocEvent{
  final String email;
  final String password;
  final String phoneNumber;
  final String firstName;
  final String lastName;

  RegisterEvent(this.email, this.password, this.phoneNumber, this.firstName, this.lastName);

  @override
  List<Object?> get props => [email,password,phoneNumber,firstName,lastName];
}
