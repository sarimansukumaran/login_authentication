import 'package:flutter/material.dart';
import 'package:login_authentication/controller/register_screen_controller.dart';
import 'package:login_authentication/view/home_screen/home_screen.dart';
import 'package:login_authentication/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((value) async {
      bool isloggedIn = RegisterScreenController.getisLogged();
      if (isloggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 33, 158),
      body: Center(
        child: Icon(
          Icons.login,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
