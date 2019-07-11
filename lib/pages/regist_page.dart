import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nvshu/widget/dialog_widget.dart';
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
                            fontSize:_sp(54),
                            fontWeight: FontWeight.w500,
                            color: GlobalConfig.color,
                            decoration: TextDecoration.none,
                          ),
                        )),
                    Container(
                      child:
                      Input(labelText: "输入 手机号/电子邮箱注册", hintText: "输入 手机号/电子邮箱注册"),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: _height(99)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: _width(20)),
                              width: _width(350),
                              child: Input(
                                  hintText: "请输入验证码", labelText: "请输入验证码"),
                            ),
                            CaptchaButton()
                          ],
                        )),
                    Container(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      height: _height(86),
                      margin: EdgeInsets.only(top: ScreenUtil().setWidth(145)),
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        textColor: Theme
                            .of(context)
                            .primaryColor,
                        color: Color(0xFFfaf1ce),
                        child: Text("下一步"),
                        onPressed: () {
                          showDialog(context: context,
                              builder: (BuildContext context) {
                                return DialogWidget(title: "请输入正确的手机号码");
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(300),
                ),
                child: Text(
                  "已有账号，去登录>>",
                  style: TextStyle(color: Theme
                      .of(context)
                      .primaryColor),
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
}

class CaptchaButton extends StatefulWidget {
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
          border: Border.all(color: Color(0xffE1DDCB),width: 2),
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
          style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Theme
              .of(context)
              .primaryColor),
        ),
      ),
    );
  }
}

/*class AnimatedCaptcha extends AnimatedWidget {
  final AnimationController controller;
  bool _pressed = false;

  AnimatedCaptcha({Key key, Animation<int> animation, this.controller})
      : super(key: key, listenable: animation) {
    controller.addStatusListener((status) {
      print(status);

      if (status == AnimationStatus.completed) {
        _pressed = false;
      } else if (status == AnimationStatus.forward) {
        _pressed = true;
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Animation<int> animation = listenable;
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(227),
      height: ScreenUtil().setHeight(72),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: GlobalConfig.colorBackground,
        disabledColor: GlobalConfig.colorBackground,
        onPressed: _pressed
            ? null
            : () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return new SimpleDialog(
                        title: Text("提示"),
                      );
                    });
                controller.reset();
                controller.forward();
              },
        child: Text(
          _pressed ? '${animation.value}s后重新获取' : '获取验证码',
          style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}*/
