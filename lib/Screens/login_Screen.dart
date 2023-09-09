// ignore_for_file: use_build_context_synchronously

import 'package:chatapp/Constants.dart';
import 'package:chatapp/Helper/ShowSnackBar.dart';
import 'package:chatapp/Models/CustomTextField.dart';
import 'package:chatapp/Screens/Chat_Screen.dart';
import 'package:chatapp/Screens/Register_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Models/CustomWideButton.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  String? email;
  String? password;

  Future<void> authUser() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Scholar Chat",
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
                        "Sign in",
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
                    ispassword: true,
                    hintText: "Password",
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
                        await authUser();
                        ShowSnackBarMsg(context, "Success");
                        Navigator.pushNamed(context, ChatScreen.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ShowSnackBarMsg(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          ShowSnackBarMsg(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {}
                      isLoading = false;
                      textEditingController.clear();
                      setState(() {});
                    }
                  },
                  buttonText: "Login ",
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?  ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            {Navigator.pushNamed(context, RegisterScreen.id)},
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
