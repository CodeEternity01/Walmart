import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ayurvan/Authentication/repository/signUpemailFailure.dart';
import 'package:ayurvan/Authentication/screens/welcome_screen.dart';
import 'package:ayurvan/screens/api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() => const ApiScreen());
    }
  }

  Future<void> createUserwithEmailandPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        'Signup Successful',
        'You can now log in with your credentials',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailandPasswordFailure.code(e.code);
      Get.snackbar('Error', ex.message, snackPosition: SnackPosition.BOTTOM);
      throw ex;
    } catch (e) {
      final ex = const SignUpWithEmailandPasswordFailure();
      Get.snackbar('Error', ex.message, snackPosition: SnackPosition.BOTTOM);
      throw ex;
    }
  }

  Future<void> loginUserwithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Error', e.message ?? 'An error occurred',
          snackPosition: SnackPosition.BOTTOM);
    } catch (_) {
      Get.snackbar('Login Error', 'An unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign in using Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in aborted by user.');
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Error', e.message ?? 'An error occurred',
          snackPosition: SnackPosition.BOTTOM);
      rethrow;
    } catch (e) {
      Get.snackbar('Login Error', 'An unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
      throw Exception('Sign-in failed: ${e.toString()}');
    }
  }

  Future<void> logOut() async {
    await GoogleSignIn().signOut();  // Sign out from Google
    await _auth.signOut();           // Sign out from Firebase
  }
}

