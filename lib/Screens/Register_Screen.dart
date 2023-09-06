import 'package:chatapp/Models/CustomTextField.dart';
import 'package:chatapp/Screens/Register_Screen.dart';
import 'package:chatapp/Screens/login_Screen.dart';
import 'package:flutter/material.dart';

import '../Models/CustomWideButton.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String id = "RegisterPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2b475e),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/scholar.png",
                      height: 100,
                    ),
                    const Text(
                      "Scholar Chat",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CustomTextField(
                  hintText: "Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomWideButton(
                buttonText: "SignUp",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?  ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
