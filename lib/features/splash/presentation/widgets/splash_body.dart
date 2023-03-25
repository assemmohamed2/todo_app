import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';
import '../../../onBoarding/presentation/on_boarding_screen.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {


  @override
  void initState() {
    super.initState();
    goToNextView();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Image.asset('images/icons8-todo-list-66.png',)),
          Positioned.fill(
            child: SpinKitThreeBounce(color: Colors.white,size: 20,)

          ),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 5), () {
      Get.to(() => OnBoardingView(), transition: Transition.fade);
    });
  }
}