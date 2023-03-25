import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../view/auth/auth_button.dart';
import '../../../../../view/auth/auth_text_form_field.dart';
import '../../../../../view/logic/auth_controller.dart';
import '../../../../../view/utils/my_string.dart';
import '../../../../../view/utils/themes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: mainColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'If you want to recover your account, then please provide your email ID below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_mdhnmscc.json'
                ),
                const SizedBox(
                  height: 50,
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
                    Icons.email,
                    color: mainColor,
                    size: 25,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        controller.resetPassword(email);
                      }
                    },
                    text: "SEND",
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}