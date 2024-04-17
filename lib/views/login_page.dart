import 'package:donation/bloc/auth_bloc/auth_bloc.dart';
import 'package:donation/bloc/auth_bloc/auth_bloc_event.dart';
import 'package:donation/bloc/auth_bloc/auth_bloc_state.dart';
import 'package:donation/views/donations_page.dart';
import 'package:donation/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_widget.dart';
import '../widgets/custom_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthBloc authBloc = AuthBloc(AuthBlocInitialState());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.462, // Adjust the height as needed
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                'assets/login_banner.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6, // Adjust the height as needed
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const CustomText(title: 'LOGIN',),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: "Email",controller: emailController,prefixIcon: Icons.email_outlined),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: "Password",controller: passwordController,prefixIcon: Icons.lock_outline,),
                    const SizedBox(height: 20),
                    CustomButton(onTap: () {
                      if(emailController.text == "" || passwordController.text == "" ){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Email or Password can't be empty",
                              style:TextStyle(color: Colors.white,fontSize:16.0),
                            ),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }else{
                          authBloc.add(LoginEvent(emailController.text , passwordController.text));
                      }
                    }, buttonText: "LOGIN"),
                    BlocConsumer(
                      bloc:authBloc,
                        listener: (context,state){
                          if(state is LoginState){
                            if(state.loginResponse.status == "ok"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DonationsPage()), // Navigate to NextScreen
                              );
                            }
                          }
                          if(state is AuthBlocFailureState){
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                content: Text(
                                  state.loginResponse.error ?? "unknown error",
                                  style:const TextStyle(color: Colors.white,fontSize:16.0),
                                ),
                                backgroundColor: Colors.red,
                                duration:const Duration(seconds: 3),
                              ),
                            );
                          }
                          },
                        builder: (context,state) {
                          if (state is AuthBlocLoadingState) {
                            return const LoaderWidget();
                          }
                          return const Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: SizedBox(width: 2),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
