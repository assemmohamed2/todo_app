import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_list/features/auth/presentation/pages/signup/sign_up_screen.dart';

import '../../../../../view/auth/auth_button.dart';
import '../../../../../view/auth/auth_text_form_field.dart';
import '../../../../../view/auth/container_under.dart';
import '../../../../../view/logic/auth_controller.dart';
import '../../../../../view/utils/my_string.dart';
import '../../../../../view/utils/themes.dart';
import '../forgot_password/forgot_screen.dart';
import '../signup/widgets/text_utils.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "LOG",
                            color: mainColor,
                            underLine: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "IN",
                            color:
                             Colors.black,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFromField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon:  Icon(
                          IconlyLight.profile,
                          color: mainColor,
                          size: 30,
                        ), suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 20,
                      ), hintText: 'Email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText:
                            controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon:  Icon(
                              IconlyLight.lock,
                              color: mainColor,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibilty
                                  ? const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                                  : const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                            ), hintText: 'Password',
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.to(ForgotPasswordScreen());
                          },
                          child: TextUtils(
                            text: 'Forgot Password?',
                            fontSize: 14,
                            color:
                            Colors.black,
                            underLine: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text;

                              controller.logInUsingFirebase(
                                  email: email, password: password);
                            }
                          },
                          text: "LOG IN",
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        text: "OR",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.faceBookSignUpApp();
                            },
                            child: Image.asset(
                              "images/facebook.png",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                              onTap: () {
                                controller.googleSinUpApp();
                              },
                              child: Image.asset(
                                "images/google.png",
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't have an Account? ",
              textType: "Sign up",
              onPressed: () {
                Get.to(SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}