import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config.dart';

class DialogWidget extends Dialog {
  final String title;

  DialogWidget({
    Key key,@required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntrinsicWidth(
        stepWidth: 56.0,
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(538),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(35),
                  ScreenUtil().setHeight(42),
                  ScreenUtil().setWidth(35),
                  ScreenUtil().setHeight(40)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF76725b),
                      fontWeight: FontWeight.w300,
                      fontSize: ScreenUtil().setSp(32),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Container(
                    alignment: FractionalOffset.bottomRight,
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            "确定",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(32),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                color: Color(0xfff85e5e)),
                          ),
                        )),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: GlobalConfig.colorBackground),
          ),
        ));
  }
}
