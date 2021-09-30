import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/Constants.dart';
import 'package:flash_chat/Screens/Register_Screen.dart';
import 'package:flash_chat/Screens/Login_Screen.dart';
import 'package:flash_chat/utilities/Reusable_Cards.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  int i = 10;
  late AnimationController controller;
  late Animation animation;
  late Animation colors;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this,
        upperBound: 0.8,
        lowerBound: 0.4);
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    // colors=ColorTween(begin:Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.0,
                  margin: EdgeInsets.all(15.0),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'logo',
                            child: Icon(
                              Icons.flash_on_sharp,
                              color: Colors.yellow,
                              size: animation.value * 100,
                            ),
                          ),
                          AnimatedTextKit(
                              totalRepeatCount: i,
                              pause: const Duration(milliseconds: 600),
                              displayFullTextOnTap: true,
                            animatedTexts: [
                            TypewriterAnimatedText(
                            'Flash Chat',
                            textStyle: kTextHeadingStyle,
                              speed: const Duration(milliseconds: 200),
                            ),
                              ]),
                        ]),
                  ),
                ),
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  text: 'Login',
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  colour: Colors.blue,
                  text: 'Register',
                  onPress: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
