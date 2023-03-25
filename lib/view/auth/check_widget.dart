import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/auth/presentation/pages/signup/widgets/text_utils.dart';
import '../logic/auth_controller.dart';
import '../utils/themes.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                  ? Icon(
                Icons.done,
                color: mainColor,
              )
                  : Image.asset('images/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "I accept ",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "terms & conditions",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}