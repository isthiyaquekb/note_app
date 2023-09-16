import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_keys.dart';
import 'package:note_app/core/app_routes.dart';
import 'package:note_app/model/user_model.dart';

class AuthController extends GetxController {
  final storageBox = GetStorage();

  static AuthController get instance => Get.find();
  final loginEmailFormKey = GlobalKey<FormState>();
  final loginPasswordFormKey = GlobalKey<FormState>();
  final signUpFirstNameFormKey = GlobalKey<FormState>();
  final signUpLastNameFormKey = GlobalKey<FormState>();
  final signUpEmailFormKey = GlobalKey<FormState>();
  final signUpPasswordFormKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();

  var isLoading = false.obs;
  var isVisible = true.obs;
  var isFirstnameValid = false;
  var isLastnameValid = false;
  var isEmailValid = false;
  var isPasswordValid = false;

  var isLoginEmailValid = false;
  var isLoginPasswordValid = false;

  var firstname = "".obs;
  var lastname = "".obs;
  var email = "".obs;
  var password = "".obs;
  var loginEmail = "".obs;
  var loginPassword = "".obs;

  FirebaseAuth? auth;
  FirebaseFirestore? firestore;
  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();

    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth!.currentUser);
    firebaseUser.bindStream(auth!.userChanges());
    ever(firebaseUser, (callback) => setInitialScreen);
  }

  setInitialScreen(User user){
    user==null?Get.offAllNamed(AppRoutes.login):Get.offAllNamed(AppRoutes.dashboard);
  }
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  void togglePasswordVisible() {
    if (isVisible.value == true) {
      isVisible.value = false;
    } else {
      isVisible.value = true;
    }
  }

  String? firstnameValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter a name.';
    }
    return null;
  }

  String? lastnameValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter a name.';
    }
    return null;
  }

  String? emailValidator(String value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid password';
    } else if (value.length < 8) {
      return 'Password requires 8 characters or more';
    }
    return null;
  }

  void signUpSession() {
    isFirstnameValid = signUpFirstNameFormKey.currentState!.validate();
    isLastnameValid = signUpLastNameFormKey.currentState!.validate();
    isEmailValid = signUpEmailFormKey.currentState!.validate();
    isPasswordValid = signUpPasswordFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isFirstnameValid &&
        isLastnameValid &&
        isEmailValid &&
        isPasswordValid) {
      log("ON SAVED FIRST: ${firstNameController.text}");
      log("ON SAVED LAST: ${lastNameController.text}");
      log("ON SAVED EMAIL: ${emailController.text}");
      log("ON SAVED PASSWORD: ${passwordController.text}");
      signUpApi(emailController.text, passwordController.text,
          firstNameController.text, lastNameController.text);
    }
  }

  void loginSession() {
    isLoginEmailValid = loginEmailFormKey.currentState!.validate();
    isLoginPasswordValid = loginPasswordFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isLoginEmailValid && isLoginPasswordValid) {
      log("ON SAVED EMAIL: ${loginEmailController.text}");
      log("ON SAVED PASSWORD: ${loginPasswordController.text}");
      loginApiCall(loginEmailController.text, loginPasswordController.text);
    }
  }

  void signUpApi(
      String email, String password, String firstname, String lastname) async {
    isLoading.value=true;
    try {
      var response = await auth!
          .createUserWithEmailAndPassword(email: email, password: password);
      log("CREATED SIGNUP RESPONSE:${response.toString()}");
      firebaseUser.value=auth!.currentUser;
      log("FIREBASE USER VALUE RESPONSE:${firebaseUser.value.toString()}");
      if (firebaseUser.value != null) {
        isLoading.value=false;
        final userData =
            UserModel(firstname: firstname, lastname: lastname, email: email);
        createUser(userData);
        Get.offAllNamed(AppRoutes.login);
      } else {
        isLoading.value=false;
        Get.offAllNamed(AppRoutes.signUp);
      }
    } on FirebaseAuthException catch (firebaseException) {
      isLoading.value=false;
      throw firebaseException.code;
    } catch (e) {
      isLoading.value=false;
      throw e.toString();
    }
  }

  void loginApiCall(String email, String password) async {
    isLoading.value=true;
    try {
      var response = await auth!
          .signInWithEmailAndPassword(email: email, password: password);
      log("SIGN RESPONSE===>${response.toString()}");
      log("FIREBASE RESPONSE===>${firebaseUser.value!.email!=null}");
      firebaseUser.value=auth!.currentUser;
      storageBox.write(AppKeys.keyIsLogged, true);
      firebaseUser.value!=null
          ? Get.offAllNamed(AppRoutes.dashboard)
          : Get.offAllNamed(AppRoutes.login);
      isLoading.value=false;
    } on FirebaseAuthException catch (e) {
      isLoading.value=false;
      throw e.stackTrace.toString();
    } catch (e) {
      isLoading.value=false;
      log("Exception:${e.toString()}");
      throw e.toString();
    }
  }

  void createUser(UserModel userModel) async {
    await firestore
        ?.collection("Users")
        .add(userModel.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade100,
            colorText: AppColor.black))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
          colorText: AppColor.black);
    });
  }
}
