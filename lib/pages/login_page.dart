import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              width: ScreenUtil().setWidth(255),
              height: ScreenUtil().setHeight(313),
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
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(200), left: ScreenUtil().setWidth(52),
                    right: ScreenUtil().setWidth(70)),
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
                        margin: EdgeInsets.only(top: ScreenUtil().setWidth(100)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: ScreenUtil().setWidth(21)),
                              width: ScreenUtil().setWidth(350),
                              child: Input(
                                  hintText: "请输入验证码", labelText: "请输入验证码"),
                            ),
                            CaptchaButton()
                          ],
                        )),
                    Container(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      height: ScreenUtil().setHeight(90),
                      margin: EdgeInsets.only(top: ScreenUtil().setWidth(148)),
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
                  top: ScreenUtil().setHeight(320),
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

class _CaptchaButtonState extends State<CaptchaButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  final double waitSecond = 120; //等待时间

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 120), vsync: this)
    ..addListener((){
//      print(animation.value);
    })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("动画完成！");
        }
      });
    animation = Tween(begin: waitSecond, end: 0.0).animate(_controller);
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCaptcha(
      animation: animation,

    );
  }
}

class AnimatedCaptcha extends AnimatedWidget {
  AnimatedCaptcha({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
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
        onPressed: () {
          print("开始");
        },
        child: Text(
          '${animation.value}获取验证码',
          style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
