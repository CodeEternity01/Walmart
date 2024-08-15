import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerging_tech/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignup = true;
  String email = '';
  String username = '';
  String password = '';
  bool goterror = false;
  String errormsg = '';
  bool isauthenticating = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController signUpUsernameController =
      TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();

  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();

  @override
  void dispose() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpUsernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      final valid = _formkey.currentState!.validate();

      if (valid) {
        _formkey.currentState!.save();

        try {
          setState(() {
            isauthenticating = true;
          });
          final response = await _firebase.signInWithEmailAndPassword(
              email: email, password: password);
        } on FirebaseAuthException catch (error) {
          setState(() {
            goterror = true;
            errormsg = error.code;
          });

          Timer(
            const Duration(milliseconds: 1000),
            () {
              setState(() {
                goterror = false;
                errormsg = '';
              });
            },
          );

          setState(() {
            isauthenticating = false;
          });
        }
      }
    }

    void signUp() async {
      final valid = _formkey.currentState!.validate();

      if (valid) {
        _formkey.currentState!.save();

        try {
          setState(() {
            isauthenticating = true;
          });
          final userCredentials = await _firebase
              .createUserWithEmailAndPassword(email: email, password: password);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredentials.user!.uid)
              .set({
            'username': username,
            'email': email,
          });
        } on FirebaseAuthException catch (error) {
          setState(() {
            goterror = true;
            errormsg = error.code;
          });

          Timer(
            const Duration(milliseconds: 1000),
            () {
              setState(() {
                goterror = false;
                errormsg = '';
              });
            },
          );

          setState(() {
            isauthenticating = false;
          });
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/trolley.jpg',
                ),
                fit: BoxFit.cover)
            ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(12, 6, 6, 0.239),
                  border: Border.all(
                      color: const Color.fromARGB(149, 38, 34, 34),
                      width: 0.5)),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(isSignup ? 'Sign Up' : 'Sign In',
                          style: const TextStyle(fontSize: 40,color: Colors.white)),
                    ),
                    Visibility(
                      visible: isSignup,
                      child: Inputfield(
                        lable: 'Username',
                        keyboardtype: 'text',
                        onchange: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 4) {
                            return 'Username must contain atleast 4 character';
                          }
                          return null;
                        },
                        controller: signUpUsernameController,
                      ),
                    ),
                    Inputfield(
                      keyboardtype: 'email',
                      lable: 'Email',
                      onchange: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please provide a valid Email';
                        }
                        return null;
                      },
                      controller: isSignup
                          ? signUpEmailController
                          : signInEmailController,
                    ),
                    Inputfield(
                      keyboardtype: 'pass',
                      lable: 'Password',
                      onchange: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'password must contain 8 characters';
                        }

                        return null;
                      },
                      controller: isSignup
                          ? signUpPasswordController
                          : signInPasswordController,
                    ),
                    Visibility(
                        visible: goterror,
                        child: Text(
                          errormsg,
                          style: const TextStyle(color: Colors.red),
                        )),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll( Color(0xFF0071CE))),
                      onPressed: () {
                        isSignup ? signUp() : signIn();
                      },
                      child: isauthenticating
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                            )
                          : Text(
                              isSignup ? 'Sign Up ' : 'Sign In',
                              style: const TextStyle(color: Colors.white),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isSignup
                            ? 'Already a account'
                            : 'Create a account',style: const TextStyle(
                              color: Colors.white
                            ),),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isSignup = !isSignup;
                              });
                            },
                            child: Text(
                              isSignup ? 'Sign in' : 'Sign Up',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
