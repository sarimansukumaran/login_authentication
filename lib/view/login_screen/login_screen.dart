import 'package:flutter/material.dart';
import 'package:login_authentication/controller/register_screen_controller.dart';
import 'package:login_authentication/view/home_screen/home_screen.dart';
import 'package:login_authentication/view/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formemail = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final _formpswd = GlobalKey<FormState>();
  TextEditingController pswdController = TextEditingController();
  bool _obscureText = true;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in to Your Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formemail,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Email Address",
                    border: OutlineInputBorder(),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (emailController.text.contains("@")) {
                      emailController.text = value.toString();

                      return null;
                    } else {
                      return "Please enter valied email address";
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formpswd,
                child: TextFormField(
                  //obscureText: true,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      hintText: "Your Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            color: Color.fromARGB(255, 197, 194, 194),
                          ))),
                  controller: pswdController,
                  validator: (value) {
                    if (pswdController.text.length > 4) {
                      pswdController.text = value.toString();
                      return null;
                    } else {
                      return "Please enter valied password";
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    icon: Icon(_isChecked
                        ? Icons.check_box
                        : Icons.check_box_outline_blank)),
                Text("Remember Me"),
                SizedBox(
                  width: 100,
                ),
                TextButton(onPressed: () {}, child: Text("Forget Password"))
              ],
            ),
            InkWell(
              onTap: () {
                if (_formemail.currentState!.validate() &&
                    _formpswd.currentState!.validate()) {
                  if (emailController.text ==
                          RegisterScreenController.getEmail() &&
                      pswdController.text ==
                          RegisterScreenController.getPassword()) {
                    RegisterScreenController.isLogged(true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    print(RegisterScreenController.getEmail());
                    print(RegisterScreenController.getPassword());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid email or password")),
                    );
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 360,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 24, 33, 158),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
