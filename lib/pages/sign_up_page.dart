import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/auth_controller.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_routes.dart';
import 'package:note_app/core/app_theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Note App",
                  style: Theme.of(context).textTheme.labelLarge,
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
                key: authController.signUpFirstNameFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(
                    labelText: "First name",
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
                  controller: authController.firstNameController,
                  onSaved: (String? value) {
                    authController.firstname.value = value!;
                    authController.firstname.value= authController.firstNameController.text;
                  },
                  validator: (String? value) {
                    return authController.firstnameValidator(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: authController.signUpLastNameFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(
                    labelText: "Last name",
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
                  controller: authController.lastNameController,
                  onSaved: (String? value) {
                    authController.lastname.value = value!;
                    authController.lastname.value = authController.lastNameController.text;
                  },
                  validator: (String? value) {
                    return authController.lastnameValidator(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: authController.signUpEmailFormKey,
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
                  controller: authController.emailController,
                  onSaved: (String? value) {
                    authController.email.value = value!;
                    authController.email.value = authController.emailController.text;
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
                      key: authController.signUpPasswordFormKey,
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
                    controller: authController.passwordController,
                    onSaved: (String? value) {
                      authController.password.value = value!;
                      authController.password.value = authController.passwordController.text;
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
                  authController.signUpSession();
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
                      "Sign up",
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
                  Get.toNamed(AppRoutes.login);
                },
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: Theme.of(context).textTheme.displaySmall,children: const [
                        TextSpan(text: ' Login', style: TextStyle(color: AppColor.accentColor, fontSize: 14)
                        )
                      ]
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
