import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextHeadingStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w700,
);
const kTextButtons = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);
const kBigTextButtons = TextStyle(
  fontSize: 25.0,
  color: Colors.white,
);
const kTextFieldRegisterDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kTextFieldLoginDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kTextFieldContent = TextStyle(
  color: Colors.black87,
  fontSize: 20.0,
);
const kTextFieldChatDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
  ),
);
const kTextFieldChatContent = TextStyle(
  color: Colors.black87,
  fontSize: 16.0,
);
