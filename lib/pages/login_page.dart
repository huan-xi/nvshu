import 'package:flutter/material.dart';

import '../config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: FractionalOffset.bottomRight,
            child: Image.asset(
              "images/girl.png",
              width: 127.5,
              height: 156.5,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 133,
                top: 366
            ),
            child: Image.asset(
              "images/dot.png",
              width: 354.5,
              height: 384.5,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: 100,
                    left: 27
                ),
                child: Text("欢迎来到掌上女书",
                  style:TextStyle(
                    color: GlobalConfig.color
                  ),),
              )
            ],
          )
        ],
      ),
      color: GlobalConfig.colorBackground,
    );
  }
}
