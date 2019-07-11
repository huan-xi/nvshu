import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  final _titleStyle = TextStyle(
      fontSize: ScreenUtil().setSp(36),
      color: Color(0xff3a362e),
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(21)),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(67)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "个人中心",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(36),
                            color: Color(0xff3a362e),
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(355),
                              top: ScreenUtil().setHeight(3)),
                          child: Image.asset(
                            'images/icon/search2.png',
                            width: ScreenUtil().setHeight(32),
                            height: ScreenUtil().setHeight(32),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(36),
                              top: ScreenUtil().setHeight(3)),
                          child: Image.asset(
                            'images/icon/setting.png',
                            width: ScreenUtil().setHeight(32),
                            height: ScreenUtil().setHeight(32),
                          )),
                      Container(
                        margin:
                            EdgeInsets.only(left: ScreenUtil().setWidth(34)),
                        child: Image.asset(
                          'images/icon/add.png',
                          width: ScreenUtil().setHeight(41),
                          height: ScreenUtil().setHeight(41),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(41)),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: CachedNetworkImageProvider(
                              "http://file.huanxi.life:86/upload/fadsfsad.png"),
                          width: ScreenUtil().setHeight(145),
                          height: ScreenUtil().setHeight(145),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(19)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "亚卡楠",
                                style: _titleStyle,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(28)),
                                child: Text(
                                  "太阳每天都是新的，你是否每天都在学习",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(24),
                                      color: Color(0xff757168),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "相关作品",
                                  style: _titleStyle,
                                ),
                                Text("查看全部")
                              ],
                            )),*/
                      ],
                    )),
                Container(

                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff4f4f1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          width: ScreenUtil().setWidth(150),
                          height: ScreenUtil().setHeight(100),
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(7)),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "69",
                                  style: _titleStyle,
                                ),
                                Text(
                                  "关注",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(24),
                                      color: Color(0xff757168)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                /*ListView(
                    children: <Widget>[
                      Text("test")

                    ]),*/
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(26)),
                  height: ScreenUtil().setHeight(360),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                    _itemCard(
                        "http://ps5t8f9qs.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720190611191801@3x.png",
                        "女书作品集",
                        "Thep Toy"),
                    _itemCard(
                        "http://ps5t8f9qs.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720190611212511@3x.png",
                        "女书作品集",
                        "Thep Toy"),
                    _itemCard(
                        "http://ps5t8f9qs.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720190611191336@3x.png",
                        "女书作品集",
                        "Thep Toy"),
                  ])
                ),
                Container(
                  margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
                  child: RaisedButton(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("登入/注册"),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }

  _itemCard(String image, String title, String sub) {
    return Container(
      margin: EdgeInsets.only(right:  ScreenUtil().setWidth(21)),
      width: ScreenUtil().setWidth(264),
      height: ScreenUtil().setHeight(360),
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(image),
            width: ScreenUtil().setWidth(264),
            height: ScreenUtil().setHeight(360),
            fit: BoxFit.cover,
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(268),left: ScreenUtil().setWidth(23)),
              child: Text(title,style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Color(0xff3f3b33)
              ),)),
        ],
      ),
    );
  }
}
