import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nvshu/widget/search_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = "请输入要查找的字或词";

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  double appBarAlpha = 0;

  var _titleStyle =
      TextStyle(fontSize: ScreenUtil().setSp(32), fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: _listView,
            ),
          ],
        ));
  }

  TextStyle _textStyle = TextStyle(
      fontSize: ScreenUtil().setSp(20),
      color: Color(0xffa1a09c),
      fontWeight: FontWeight.w600);

  Widget get _listView {
    TextStyle _descStyle = TextStyle(
        fontSize: ScreenUtil().setSp(20),
        color: Color(0xffBAB792),
        fontWeight: FontWeight.w600);

    return Container(
      child: ListView(children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset("images/banner.png"),
            SearchBar(
              leftButtonClick: () {},
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(295),
                  top: ScreenUtil().setHeight(173)),
              child: Text(
                "一花一世界",
                style: TextStyle(fontSize: ScreenUtil().setSp(48),
                color: Color(0xfff5f5f8),
                fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(400),
                  top: ScreenUtil().setHeight(255)),
              child: Text(
                "一起体验女书的世界",
                style: TextStyle(fontSize: ScreenUtil().setSp(32),
                    color: Color(0xfff5f5f8),
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        _banner,
        //签到，pk
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(9)),
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(30), top: ScreenUtil().setHeight(14)),
          child: Row(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Text("每日签到", style: _titleStyle),
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(16),
                          top: ScreenUtil().setHeight(24)),
                    ),
                    Container(
                      child: Image.asset(
                        "images/icon/calendar.png",
                        width: ScreenUtil().setWidth(96),
                        height: ScreenUtil().setHeight(90),
                      ),
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(190),
                          top: ScreenUtil().setHeight(33)),
                    ),
                    Container(
                      child: Text(
                        "签到送好礼",
                        style: _descStyle,
                      ),
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
                    ),
                    Container(
                      child: Text(
                        "火热来袭",
                        style: _descStyle,
                      ),
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(108),
                          left: ScreenUtil().setWidth(80)),
                    ),
                  ],
                ),
                width: ScreenUtil().setWidth(313),
                height: ScreenUtil().setHeight(151),
                decoration: BoxDecoration(
                    color: Color(0xffF9f7e9),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "挑战PK",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            fontWeight: FontWeight.w600),
                      ),
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(72),
                          top: ScreenUtil().setHeight(24)),
                    ),
                    Container(
                      child: Image.asset(
                        "images/icon/game.png",
                        width: ScreenUtil().setWidth(99),
                        height: ScreenUtil().setHeight(80),
                      ),
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(200),
                          top: ScreenUtil().setHeight(61)),
                    ),
                    Container(
                      child: Text("带你玩爆不一样", style: _descStyle),
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(70),
                          left: ScreenUtil().setWidth(28)),
                    ),
                    Container(
                      child: Text(
                        "的游戏世界",
                        style: _descStyle,
                      ),
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(108),
                          left: ScreenUtil().setWidth(68)),
                    ),
                  ],
                ),
                width: ScreenUtil().setWidth(313),
                height: ScreenUtil().setHeight(151),
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(34)),
                decoration: BoxDecoration(
                    color: Color(0xffeae7db),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24),
              top: ScreenUtil().setHeight(30),
              right: ScreenUtil().setWidth(26)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Text(
                    "热门推荐",
                    style: _titleStyle,
                  ),
                  Container(
                      alignment: FractionalOffset.topRight,
                      child: Text(
                        "更多",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color(0xffBAB792),
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                ],
              ),
              _boxItem(
                  "http://ps5t8f9qs.bkt.clouddn.com/%E7%AC%AC%E4%B8%80%E5%BC%A0%E5%9B%BE%E7%89%87@2x.png",
                  "学会用女书来说话",
                  "共21篇",
                  "推广",
                  "2019-07-19"),
              _line,
              _boxItem(
                  "http://ps5t8f9qs.bkt.clouddn.com/%E7%AC%AC%E4%BA%8C%E5%BC%A0%E5%9B%BE%E7%89%87@2x.png",
                  "每天坚持5分钟，掌握女书基本词汇",
                  "",
                  "推广",
                  "2019-07-19"),
              _line,
              _boxItem(
                  "http://ps5t8f9qs.bkt.clouddn.com/%E5%9B%BE%E5%B1%82-3@2x.png",
                  "天天看视频，快乐每一天",
                  "共33篇",
                  "推广",
                  "2019-07-20"),
              _line,
              _boxItem(
                  "http://ps5t8f9qs.bkt.clouddn.com/%E5%9B%BE%E5%B1%82-2@2x.png",
                  "挑战自我，女神带你PK",
                  "",
                  "推广",
                  "2019-07-20"),
              _line,
              _boxItem(
                  "http://ps5t8f9qs.bkt.clouddn.com/%E5%9B%BE%E5%B1%82-7@2x.png",
                  "学女书要从娃娃抓起",
                  "共7篇",
                  "推广",
                  "2019-06-20"),
              _line,
              _boxItem(
                  "http://ps5t8f9qs.bkt.clouddn.com/%E5%9B%BE%E5%B1%82-8@2x.png",
                  "日常口语，你会了吗",
                  "共120篇",
                  "推广",
                  "2019-07-20"),
            ],
          ),
        ),
      ]),
      color: Color(0xfff6f6f6),
    );
  }

  //网格功能
  Widget get _banner {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(200),
      child: Swiper(
        itemCount: 3,
        autoplay: false,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: _bannerItem(index),
          );
        },
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeSize: 5,
                size: 5,
                activeColor: Colors.black,
                color: Color(0xff82846E))),
      ),
    );
  }

  _bannerItem(int index) {
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.w600, fontSize: ScreenUtil().setSp(20));
    return Container(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(45)),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/icon/book.png",
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(63),
                      ),
                      margin: EdgeInsets.only(bottom: 11),
                    ),
                    Text("学字词", style: textStyle)
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(127)),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/icon/play.png",
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                      ),
                      margin: EdgeInsets.only(bottom: 11),
                    ),
                    Text("看动画", style: textStyle)
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(116)),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/icon/gift.png",
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(63),
                      ),
                      margin: EdgeInsets.only(bottom: 11),
                    ),
                    Text("知识竞猜", style: textStyle)
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(110)),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/icon/light.png",
                        width: ScreenUtil().setWidth(41),
                        height: ScreenUtil().setHeight(62),
                      ),
                      margin: EdgeInsets.only(bottom: 11),
                    ),
                    Text("诗歌鉴赏", style: textStyle)
                  ],
                )),
          ],
          mainAxisSize: MainAxisSize.max,
        ),
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(22),
            bottom: ScreenUtil().setHeight(10)),
      ),
    );
  }

  Widget get _line {
    return Container(
      width: ScreenUtil().setWidth(682),
      height: ScreenUtil().setHeight(2),
      color: Color(0x33BAB792),
    );
  }

  Widget _boxItem(
      String imageSrc, String title, String text1, String text2, String time) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(29)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(11)),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Image(
                  image: CachedNetworkImageProvider(imageSrc),
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(163),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(46)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Color(0xff211f19),
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(24)),
                      ),
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(20),
                          bottom: ScreenUtil().setHeight(20)),
                      child: Text(
                        text1,
                        style: _textStyle,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(8)),
                              child: Image.asset(
                                "images/icon/download.png",
                                height: ScreenUtil().setHeight(21),
                                width: ScreenUtil().setWidth(22),
                              ),
                            ),
                            Text(
                              "推广",
                              style: _textStyle,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(190),
                                  right: ScreenUtil().setWidth(8)),
                              child: Image.asset(
                                "images/icon/calendar_icon.png",
                                height: ScreenUtil().setHeight(21),
                                width: ScreenUtil().setWidth(22),
                              ),
                            ),
                            Text(
                              time,
                              style: _textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
