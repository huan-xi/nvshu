import 'package:flutter/material.dart';

//页面
class LoginWidget extends StatefulWidget {
  final String title;

  final Widget from;

  final String buttonText;

  LoginWidget({Key key, this.title, this.from, this.buttonText});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//输入框
