import 'package:donation/views/donations_page.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_widget.dart';
import '../widgets/custom_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              height: MediaQuery.of(context).size.height * 0.7, // Adjust the height as needed
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                'assets/login_banner.png',
                fit: BoxFit.fill,
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
                height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DonationsPage()), // Navigate to NextScreen
                      );
                    }, buttonText: "LOGIN"),
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
