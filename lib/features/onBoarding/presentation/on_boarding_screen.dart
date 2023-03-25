import 'package:flutter/material.dart';
import 'package:todo_list/features/onBoarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}