import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/controllers/auth_controller.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_routes.dart';
import 'package:note_app/core/app_theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      body: Obx(()=>Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                  ),
                  Center(
                    child: Text(
                      "Note App",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Lets store something daily",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: authController.loginEmailFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(
                            color: AppColor.hintTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColor.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColor.primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColor.lightError),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColor.lightError),
                        ),
                      ),
                      controller: authController.loginEmailController,
                      onSaved: (String? value) {
                        authController.email.value = value!;
                        authController.loginEmailController.text = value;
                      },
                      validator: (String? value) {
                        return authController.emailValidator(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                        () => Form(
                      key: authController.loginPasswordFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        obscureText: authController.isVisible.value,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => FocusScope.of(context).unfocus(),
                        style: Theme.of(context).textTheme.labelMedium,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: AppColor.hintTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          suffixIcon: InkWell(
                            onTap: () => authController.togglePasswordVisible(),
                            child: authController.isVisible.value
                                ? const Icon(
                              Icons.visibility,
                              color: AppColor.lightDivider,
                            )
                                : const Icon(
                              Icons.visibility_off,
                              color: AppColor.lightDivider,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: AppColor.primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: AppColor.primaryColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: AppColor.lightError),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: AppColor.lightError),
                          ),
                        ),
                        controller: authController.loginPasswordController,
                        onSaved: (String? value) {
                          authController.password.value = value!;
                          authController.loginPasswordController.text = value;
                        },
                        validator: (String? value) {
                          return authController.passwordValidator(value!);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      authController.loginSession();
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: AppColor.accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUp);
                    },
                    child: Center(
                      child: RichText(
                          text: TextSpan(
                              text: 'Don\'t have an account?',
                              style: Theme.of(context).textTheme.displaySmall,children: const [
                            TextSpan(text: ' Sign up', style: TextStyle(color: AppColor.accentColor, fontSize: 14)
                            )
                          ]
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.12,
                  ),
                ],
              ),
            ),
          ),
          authController.isLoading.isTrue?Positioned(bottom: MediaQuery.of(context).viewInsets.bottom,left: 0,right: 0,child: Center(child: Lottie.asset(AppAssets.bookLoading,height: 120,width: 80),)):const SizedBox.shrink()
        ],
      ),)
    );
  }
}
