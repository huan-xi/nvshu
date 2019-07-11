import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SearchBarType { home, normal }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final String hint;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  final SearchBarType type;

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.hint,
      this.type,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return widget.type == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _inputBox() {
    return Container(
      child: TextField(
          controller: _controller,
          onChanged: _onChanged,
          autofocus: false,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Colors.black,
              fontWeight: FontWeight.w300),
          cursorColor: Color(0xffc3c3c1),
          onTap: widget.inputBoxClick,
          //输入文本的样式
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(20),
                ScreenUtil().setWidth(0),
                ScreenUtil().setWidth(20),
                0),
            border: InputBorder.none,
            hintText: "请输入要查找的字或词",
            hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: Color(0xffc3c3c1),
                fontWeight: FontWeight.w400),
          )),
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    widget.onChanged(text);
    print(text);

    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _genNormalSearch() {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), ScreenUtil().setHeight(50), 0, 0),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(31),
          ScreenUtil().setHeight(15),
          ScreenUtil().setWidth(31),
          ScreenUtil().setHeight(15)),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child:Container(
        child: TextField(
            controller: _controller,
            onChanged: _onChanged,
            autofocus: true,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: Colors.black,
                fontWeight: FontWeight.w300),
            cursorColor: Color(0xffc3c3c1),
            onTap: widget.inputBoxClick,
            //输入文本的样式
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  ScreenUtil().setWidth(20),
                  0),
              border: InputBorder.none,
              hintText: "请输入要查找的字或词",
              hintStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Color(0xffc3c3c1),
                  fontWeight: FontWeight.w400),
            )),
      ),
    );
  }
  _genHomeSearch() {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(13),
          ScreenUtil().setHeight(63), ScreenUtil().setHeight(13), 0),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(31),
          ScreenUtil().setHeight(15),
          ScreenUtil().setWidth(31),
          ScreenUtil().setHeight(15)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      height: ScreenUtil().setHeight(70),
      child: Row(
        children: <Widget>[
          widget.type == SearchBarType.home
              ? Image.asset(
            "images/icon/search.png",
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(40),
          )
              : null,
          Expanded(
              flex: 1,
              child: _wrapTap(
                  _inputBox(),
                  widget.inputBoxClick)),
        ],
      ),
    );
  }
}


