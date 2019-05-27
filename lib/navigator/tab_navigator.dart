/**
 * 《Flutter从入门到进阶-实战携程网App》
 * 课程地址：
 * https://coding.imooc.com/class/321.html
 * 课程代码、文档：
 * https://git.imooc.com/coding-321/
 * 课程辅导答疑区：
 * http://coding.imooc.com/learn/qa/321.html
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nvshu/pages/circle_page.dart';
import 'package:nvshu/pages/home_page.dart';
import 'package:nvshu/pages/index_page.dart';
import 'package:nvshu/pages/interact_page.dart';

import '../config.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = GlobalConfig.color;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    //初始化屏幕尺寸
    //一定要在home下
    ScreenUtil.instance = ScreenUtil(width: 722, height: 1282)..init(context);

    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          IndexPage(),
          InteractPage(),
          CirclePage(),
          HomePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem('首页', "home", 0),
            _bottomItem('互动', "message", 1),
            _bottomItem('圈子', "compass", 2),
            _bottomItem('我的', "my", 3),
          ]),
    );
  }

  //下部导航
  _bottomItem(String title, String icon, int index) {
    return BottomNavigationBarItem(
        icon: Image.asset("images/icon/${icon}0.png",
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(42)),
        activeIcon: Image.asset("images/icon/${icon}1.png",
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(42)),
        title: Container(
          child: Text(
            title,
            style: TextStyle(
                color: _currentIndex != index ? _defaultColor : _activeColor,
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil().setSp(20)),
          ),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(6)),
        ));
  }
}
