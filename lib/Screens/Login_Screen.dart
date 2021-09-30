import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/Constants.dart';
import 'package:flash_chat/utilities/Reusable_Cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/Screens/Chat_Screen.dart';
import 'package:loading_overlay/loading_overlay.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String user;
  late String pass;
  late final _auth=FirebaseAuth.instance;
  bool load = false;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading:load,
        child: Center(
          child: ListView(
            children: [
               Hero(
                 tag: 'logo',
                 child: Container(
                   margin: EdgeInsets.all(15.0),
                   child: Icon(
                     Icons.flash_on_sharp,
                     color: Colors.yellow,
                     size: 150.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.all(15.0),
                 child: TextField(
                   onChanged: (value){
                     user=value;
                   },
                   textAlign:TextAlign.center,
                   style: kTextFieldContent,
                   decoration: kTextFieldLoginDecoration.copyWith(
                     hintText: 'Enter your email',
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.all(15.0),
                 child: TextField(
                   onChanged:(value){
                     pass=value;
                   },
                   textAlign:TextAlign.center,
                   obscureText: true,
                   style: kTextFieldContent,
                   decoration: kTextFieldLoginDecoration.copyWith(
                     hintText: 'Enter your password',
                   ),
                 ),
               ),
               RoundedButton(
                   colour: Colors.lightBlueAccent,
                   text: 'Sign in',
                   onPress: () async{
                     setState(() {
                       load=true;
                     });
                     try {
                       await _auth.signInWithEmailAndPassword(
                           email: user, password: pass);
                       Navigator.pushNamed(context, ChatScreen.id);
                     }catch(e){
                       print(e);
                     }
                     setState(() {
                       load=false;
                     });
                   }),
            ],
          ),
        ),
      ),
    );
  }
}
