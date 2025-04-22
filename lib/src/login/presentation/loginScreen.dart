import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/src/login/data/loginApi.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;
    final textFieldHeight = size.height * 0.07;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.network(
              "https://img.freepik.com/premium-photo/calculated-statistics-financial-data-paints-detailed-picture-financial-landscapes-markets_896558-12402.jpg?w=360",
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Centered content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    HandText.greetings,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  LottieBuilder.asset(
                    'assets/json/workingChart.json',
                    height: size.height * 0.25,
                  ),
                  SizedBox(height: size.height * 0.02),
                  // Username text field
                  SizedBox(
                    height: textFieldHeight,
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: HandText.loginUsername,
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  // Password text field
                  SizedBox(
                    height: textFieldHeight,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: HandText.loginPassword,
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  // Login button
                  SizedBox(
                    width: size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        ApiService().postData(
                          {
                            "username": usernameController.text,
                            "password": passwordController.text
                          },
                          context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff003060),
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        HandText.loginBttn,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
