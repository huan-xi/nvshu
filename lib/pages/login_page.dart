import 'package:flutter/material.dart';
import 'package:nvshu/widget/input_widget.dart';
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
            margin: EdgeInsets.only(left: 133, top: 366),
            child: Image.asset(
              "images/dot.png",
              width: 354.5,
              height: 384.5,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100, left: 30, right: 35),
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: FractionalOffset.topLeft,
                        margin: EdgeInsets.only(bottom: 64),
                        child: Text(
                          "欢迎来到掌上女书",
                          style: TextStyle(
                            fontSize: 25,
                            color: GlobalConfig.color,
                            decoration: TextDecoration.none,
                          ),
                        )),
                    Container(
                      child:
                          Input(labelText: "输入手机号/电子邮箱注册", hintText: "输入手机号码"),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              width: 200,
                              child: Input(
                                  hintText: "请输入验证码", labelText: "请输入验证码"),
                            ),
                            CaptchaButton()
                          ],
                        )),
                    Container(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      height: 45,
                      margin: EdgeInsets.only(top: 73),
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        textColor: Theme.of(context).primaryColor,
                        color: Color(0xFFfaf1ce),
                        child: Text("下一步"),
                        onPressed: () {},
                      ),
                    )

//              ThirdPartyLogin(),
//              Container(
//                  child: Row(
//                children: <Widget>[Text("登入代表您已经同意"), Text("《掌上女书用户协议》")],
//              ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 186,
                ),
                child: Text(
                  "已有账号，去登录>>",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}

class CaptchaButton extends StatefulWidget {
  @override
  _CaptchaButtonState createState() => _CaptchaButtonState();
}

class _CaptchaButtonState extends State<CaptchaButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 36,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: GlobalConfig.colorBackground,
        onPressed: () {},
        child: Text(
          "获取验证码",
          style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
