import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(720),
      child: Image(
        image: CachedNetworkImageProvider(
            "http://file.huanxi.life:86/upload/fadsfsad.png"),
        width: ScreenUtil().setHeight(145),
        height: ScreenUtil().setHeight(145),
      ),
    );
  }
}
