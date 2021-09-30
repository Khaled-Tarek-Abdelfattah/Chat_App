import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/Reusable_Cards.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/utilities/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_overlay/loading_overlay.dart';

// import 'package:loading_overlay/loading_overlay.dart';
class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isMe = false;
  final messageTextController = TextEditingController();
  late final _fireStore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String userName;
  late final _auth = FirebaseAuth.instance;
  late String message;
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      loggedInUser = user!;
      userName = loggedInUser.email!;
    } catch (e) {
      print(e);
      print(2);
    }
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
    getCurrentUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chat',
            ),
            GestureDetector(
              onTap: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 20.0,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _fireStore.collection('messages').orderBy('date').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: LoadingOverlay(
                          isLoading: true,
                          child: Container(
                            color: Colors.lightBlueAccent,
                          )),
                    );
                  }
                  List<Widget> messageBubbles = [];
                  final messages = snapshot.data!.docs.reversed;
                  for (var message in messages) {
                    final messageText = message.get('text');
                    final messageSender = message.get('sender');
                    final messageDateHour = message.get('dateHour').toString();
                    var messageDateMin = message.get('dateMin');
                    if (messageDateMin < 10) {
                      messageDateMin = '0$messageDateMin';
                    }
                    isMe = messageSender == loggedInUser.email!;
                    messageBubbles.add(MessageBubble(
                        text: messageText,
                        sender: messageSender,
                        messageDateHour: messageDateHour,
                        messageDateMin: messageDateMin,
                        isMe: isMe));
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      children: messageBubbles,
                    ),
                  );
                }),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          message = value;
                        },
                        style: kTextFieldChatContent,
                        decoration: kTextFieldChatDecoration.copyWith(
                          hintText: 'Enter message',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        messageTextController.clear();
                        _fireStore.collection('messages').add({
                          'text': message,
                          'sender': userName,
                          'date': DateTime.now().toIso8601String().toString(),
                          'dateHour': DateTime.now().hour,
                          'dateMin': DateTime.now().minute,
                        });
                      },
                      child: Icon(
                        Icons.send_sharp,
                        size: 40.0,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
