import 'package:flutter/material.dart';
import 'package:nvshu/widget/input.dart';
import 'package:nvshu/widget/third_party_login.dart';

import '../config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    fontSize: 30,
                    color: GlobalConfig.color,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Input(hintText: "手机号码",inputType: InputType.phone),
              Input(hintText: "短信验证码",inputType: InputType.code),
              ThirdPartyLogin(),
              Container(child: Row(children: <Widget>[
                Text("登入代表您已经同意"),
                Text("《掌上女书用户协议》")
              ],))
            ],
          )
        ],
      ),
    );
  }
}
