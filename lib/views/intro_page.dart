import 'package:donation/views/login_page.dart';
import 'package:donation/views/signup_page.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button_widget.dart';


class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.493, // Adjust the height as needed
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                'assets/intro_banner.png',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.8,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Image.asset(
                        'assets/aoa.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.7,
                      // height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        'assets/ayat.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    // CustomTextField(labelText: "Password",controller: passwordController,prefixIcon: Icons.lock_outline,),
                    const SizedBox(height: 70),
                    CustomButton(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to NextScreen
                      );
                    }, buttonText: "LOGIN"),
                    const SizedBox(height: 20),

                    CustomButton(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()), // Navigate to NextScreen
                      );
                    }, buttonText: "SIGN UP",buttonColor: Colors.white, textColor: Colors.black,),
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
