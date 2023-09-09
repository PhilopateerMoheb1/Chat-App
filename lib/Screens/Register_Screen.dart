import 'package:chatapp/Constants.dart';
import 'package:chatapp/Models/CustomTextField.dart';
import 'package:chatapp/Screens/Register_Screen.dart';
import 'package:chatapp/Screens/login_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Helper/ShowSnackBar.dart';
import '../Models/CustomWideButton.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String id = "RegisterPage";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Form(
              key: formKey,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                    child: CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: "Email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: "Password",
                      ispassword: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomWideButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await RegisterUser();
                          ShowSnackBarMsg(context, "Success");
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ShowSnackBarMsg(context, "weak-password");
                          } else if (e.code == 'email-already-in-use') {
                            ShowSnackBarMsg(context, "email-already-in-use");
                          }
                        }
                        isLoading = false;
                        textEditingController.clear();
                        setState(() {});
                      }
                    },
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
            ),
          )),
    );
  }

  Future<void> RegisterUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
