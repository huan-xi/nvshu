import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InteractPage extends StatefulWidget {
  @override
  _InteractPageState createState() => _InteractPageState();
}

class _InteractPageState extends State<InteractPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f3f1),
      body: Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(50),
            left: ScreenUtil().setWidth(21),
            right: ScreenUtil().setWidth(22)),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "消息互动",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(36),
                        color: Color(0xff3a362e)),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/icon/search2.png',
                          width: ScreenUtil().setWidth(32),
                          height: ScreenUtil().setWidth(32),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                          child: Image.asset(
                            'images/icon/dot3.png',
                            width: ScreenUtil().setWidth(32),
                            height: ScreenUtil().setWidth(32),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
            Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(37),
                    bottom: ScreenUtil().setHeight(30)),
                alignment: Alignment.centerLeft,
                child: _subTitle("聊天室消息")),
            _box(Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "大哥，这字写的不错呀！",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color(0xff3a362e)),
                    ),
                    _dot("6")
                  ],
                )
              ],
            )),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(30),
                bottom: ScreenUtil().setHeight(30),
              ),
              alignment: Alignment.centerLeft,
              child: _subTitle("最近消息"),
            ),
            _box(Text("嘿嘿"))
          ],
        ),
      ),
    );
  }

  _subTitle(String s) {
    return Text(
      s,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(24),
          color: Color(0xff82817f),
          fontWeight: FontWeight.w500),
    );
  }

  //点
  _dot(String s) {
    return Container(
      width: ScreenUtil().setWidth(27),
      height: ScreenUtil().setWidth(27),
      decoration: BoxDecoration(
          color: Color(0xffbba574),
          borderRadius: BorderRadius.all(Radius.circular(27))),
      child: Center(
        child: Text(
          s,
          style:
              TextStyle(fontSize: ScreenUtil().setSp(18), color: Colors.white),
        ),
      ),
    );
  }

  _box(Widget child) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
          top: ScreenUtil().setHeight(35),
          bottom: ScreenUtil().setHeight(37)),
      height: ScreenUtil().setHeight(166),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: child,
    );
  }
}
