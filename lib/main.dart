import 'package:flutter/material.dart';
import 'package:flash_chat/Screens/Welcome_Screen.dart';
import 'package:flash_chat/Screens/Login_Screen.dart';
import 'package:flash_chat/Screens/Register_Screen.dart';
import 'package:flash_chat/Screens/Chat_Screen.dart';
void main() {runApp(FlashChat());}
class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black87)
          )
    ),
    routes: {
      WelcomeScreen.id:(context)=>WelcomeScreen(),
      LoginScreen.id:(context)=>LoginScreen(),
      RegisterScreen.id:(context)=>RegisterScreen(),
      ChatScreen.id:(context)=>ChatScreen(),
    },
    initialRoute: WelcomeScreen.id,
    );
  }
}
