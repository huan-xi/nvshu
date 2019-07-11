import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nvshu/widget/dialog_widget.dart';
import 'package:nvshu/widget/input_widget.dart';
import 'package:nvshu/widget/third_party_login.dart';

import '../config.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username;
  String password;
  String aPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: FractionalOffset.bottomRight,
            child: Image.asset(
              "images/girl.png",
              width: _width(255),
              height: _height(313),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: _width(266), top: _height(732)),
            child: Image.asset(
              "images/dot.png",
              width: _width(710),
              height: _height(768),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _height(199), left: _width(57), right: _width(62)),
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: FractionalOffset.topLeft,
                        margin: EdgeInsets.only(bottom: _height(123)),
                        child: Text(
                          "欢迎来到掌上女书",
                          style: TextStyle(
                            fontSize: _sp(54),
                            fontWeight: FontWeight.w500,
                            color: GlobalConfig.color,
                            decoration: TextDecoration.none,
                          ),
                        )),
                    Input(
                      labelText: "输入 手机号/电子邮箱注册",
                      hintText: "输入 手机号/电子邮箱注册",
                      onChange: (value) {
                        this.username = value;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: _height(50)),
                      child: Input(
                        hintText: "请输入密码",
                        labelText: "请输入密码",
                        onChange: (value) {
                          this.password = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: _height(50)),
                      child: Input(
                        hintText: "请确认密码",
                        labelText: "请确认密码",
                        onChange: (value) {
                          this.aPassword = value;
                        },
                      ),
                    ),
                    _button("立即注册", () {
                      if (!(username != null && username.isNotEmpty)) {
                        _showDialog("请输入正确的手机号码");
                        return;
                      }

                      if (!(password != null && password.length > 3)) {
                        _showDialog("请输入正确的密码");
                        return;
                      }

                      if (!(aPassword != null && password == aPassword)) {
                        _showDialog("两次输入的密码不一样");
                        return;
                      }
                    }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(200),
                ),
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "已有账号？去登入>>",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  _width(int i) {
    return ScreenUtil().setWidth(i);
  }

  _height(int i) {
    return ScreenUtil().setHeight(i);
  }

  _sp(int i) {
    return ScreenUtil().setSp(i);
  }

  _button(String title, onPress) {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      height: _height(86),
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(145)),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        textColor: Theme.of(context).primaryColor,
        color: Color(0xFFfaf1ce),
        child: Text(title),
        onPressed: onPress,
      ),
    );
  }

  void _showDialog(String s) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogWidget(title: s);
        });
  }
}

/*class CaptchaButton extends StatefulWidget {
  @override
  _CaptchaButtonState createState() => _CaptchaButtonState();
}

class _CaptchaButtonState extends State<CaptchaButton> {
  static const int waitSecond = 60; //等待时间
  int _countdownNum = waitSecond;
  bool _pressed = false;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (time) {
      //每秒执行一次
      if (_pressed == true) {
        setState(() {
          if (_countdownNum == 0)
            _pressed = false;
          else
            _countdownNum--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(226),
      height: ScreenUtil().setHeight(75),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE1DDCB), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(37))),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: GlobalConfig.colorBackground,
        disabledColor: GlobalConfig.colorBackground,
        onPressed: _pressed
            ? null
            : () {
                _pressed = true;
                _countdownNum = waitSecond;
              },
        child: Text(
          _pressed ? '${_countdownNum}s后重新获取' : '获取验证码',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}*/
