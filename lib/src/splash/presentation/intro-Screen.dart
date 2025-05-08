import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/routes/routeNames.dart';

class Intro_Screen extends StatefulWidget {
  const Intro_Screen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<Intro_Screen> {
  Future<bool> _checkTokenExists() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? responseData = sharedPreferences.getString('response_data');

    if (responseData == null) {
      return false;
    }

    try {
      final Map<String, dynamic> decodedResponseData =
          json.decode(responseData);
      final String? accessToken = decodedResponseData['accesstoken'];
      return accessToken != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateToAppropriateScreen();
  }

  Future<void> _navigateToAppropriateScreen() async {
    bool tokenExists = await _checkTokenExists();

    await Future.delayed(const Duration(seconds: 2));

    if (tokenExists) {
      Navigator.of(context).pushReplacementNamed(RouteNames.bottomnav);
    } else {
      Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FlutterLogo(size: 100),
            Image.asset(
              'assets/images/vitwologo.png',
              height: 350,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Vitwo Analytics App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
