import 'package:flutter/material.dart';
import 'package:login_authentication/controller/register_screen_controller.dart';

import 'package:login_authentication/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RegisterScreenController.initSharedPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
