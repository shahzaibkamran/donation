import 'package:donation/bloc/register_bloc/register_bloc.dart';
import 'package:donation/bloc/register_bloc/register_bloc_event.dart';
import 'package:donation/bloc/register_bloc/register_bloc_state.dart';
import 'package:donation/views/donations_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_widget.dart';
import '../widgets/custom_textfield_widget.dart';
import '../widgets/loader_widget.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RegisterBloc regBloc = RegisterBloc(RegisterBlocInitialState());

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
                height: MediaQuery.of(context).size.height * 0.7, // Adjust the height as needed
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
                    const CustomText(title: 'SIGN UP',),
                    const SizedBox(height: 30),
                    CustomTextField(labelText: "Email",controller: emailController,prefixIcon: Icons.email_outlined),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: "First Name",controller: fnameController,prefixIcon: Icons.person_2_outlined,),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: "Last Name",controller: lnameController,prefixIcon: Icons.person_2_outlined,),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: "Phone Number",controller: phoneController,prefixIcon: Icons.phone,),
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
                        regBloc.add(RegisterEvent(emailController.text , passwordController.text,phoneController.text,fnameController.text,lnameController.text));
                      }

                    }, buttonText: "SIGN UP"),
                    BlocConsumer(
                        bloc:regBloc,
                        listener: (context,state){
                          if(state is RegisterState){
                            if(state.loginResponse.status == "ok"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DonationsPage()), // Navigate to NextScreen
                              );
                            }
                          }
                          if(state is RegisterBlocFailureState){
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
                          if (state is RegisterBlocLoadingState) {
                            return const LoaderWidget();
                          }
                          return const Padding(
                            padding: EdgeInsets.fromLTRB(0,8, 0, 0),
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
