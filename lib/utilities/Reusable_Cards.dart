import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/Constants.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  late final Color colour;
  late final String text;
  late final Function() onPress;
  RoundedButton(
      {required this.colour, required this.text, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(40.0)),
        child: Center(
            child: Text(
          text,
          style: kBigTextButtons,
        )),
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.text,
    required this.sender,
    required this.messageDateHour,
    required this.messageDateMin,
    required this.isMe,
  });
  final messageDateMin;
  final messageDateHour;
  final text;
  final sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('$sender')),
          Padding(
            padding: isMe? EdgeInsets.only(left: 50.0):EdgeInsets.only(right: 50.0),
            child: Material(
              elevation: 6.0,
              borderRadius:isMe? BorderRadius.only(bottomLeft:Radius.circular(30.0),bottomRight: Radius.circular(30.0),topLeft: Radius.circular(30.0),):BorderRadius.only(bottomLeft:Radius.circular(30.0),bottomRight: Radius.circular(30.0),topRight: Radius.circular(30.0),),
              color:isMe? Colors.pink:Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child:Column(
                  children: [
                    Text(
                      '$text',
                      style: TextStyle(
                        color: isMe?Colors.white:Colors.black45,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '$messageDateHour:$messageDateMin ',
                      style: TextStyle(
                        color: isMe?Colors.white:Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}