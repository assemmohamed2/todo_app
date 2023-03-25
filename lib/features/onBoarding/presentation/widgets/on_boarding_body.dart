import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/features/auth/presentation/pages/login/login_screen.dart';
import '../../../auth/presentation/pages/signup/sign_up_screen.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  double scrollerPos=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (val) {
              setState(() {
                scrollerPos=val.toDouble();
              });
            },
            children: [
              OnBoardingPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Welcome\nTo Todo App',textAlign:TextAlign.center ,style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold

                    ),),
                    SizedBox(height: 10,),
                    Text('List of activity tracked',textAlign:TextAlign.center ,style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 22,
                        color: Colors.white,

                    ),),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_zavtox71.json'),
                    ),
                  ],
                ),
              ),
              OnBoardingPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Keeps you alerted',textAlign:TextAlign.center ,style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),),
                    SizedBox(height: 10,),
                    Text('with comfort',textAlign:TextAlign.center ,style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 22,
                      color: Colors.white,

                    ),),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_z4cshyhf.json'),
                    ),
                  ],
                ),
              ),
              OnBoardingPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Analyze and improve',textAlign:TextAlign.center ,style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),),
                    SizedBox(height: 10,),
                    Text('your productivity',textAlign:TextAlign.center ,style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 22,
                      color: Colors.white,

                    ),),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_mf5j5kua.json'),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(dotsCount: 3 ,position: scrollerPos,decorator: DotsDecorator(
                  activeColor: Colors.white
                ),),
                scrollerPos==2? Padding(
                  padding: const EdgeInsets.only(left: 20 , right:20 ),
                  child: ElevatedButton(style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(HexColor("#113c63"))
                  ),onPressed: (){
                     Get.to(LoginScreen());
                  }, child: Text('Start Explore')),
                ):

                TextButton(
                  child: Text('SKIP TO THE APP >',style:TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),),
                  onPressed: (){},
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final Column? boardColumn;
  const OnBoardingPage({
    Key? key,
    this.boardColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color:  HexColor("#113c63"),
          child: Center(child: boardColumn),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
                // color:HexColor("#d6d2cf")
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(100),
                topRight:Radius.circular(100),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
