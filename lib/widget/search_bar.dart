import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final String hint;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.hint,
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
          Image.asset(
            "images/icon/search.png",
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(40),
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: TextField(
                    controller: _controller,
                    onChanged: _onChanged,
                    autofocus: false,
                    style: TextStyle(
                        fontSize:ScreenUtil().setSp(24),
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                    cursorColor: Color(0xffc3c3c1),
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
                          color:Color(0xffc3c3c1),
                          fontWeight: FontWeight.w400),
                    )),
              )),
        ],
      ),
    );
  }

  _inputBox() {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(13),
          ScreenUtil().setHeight(63), ScreenUtil().setHeight(13), 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Color(0xffA9A9A9),
          ),
          Expanded(
              flex: 1,
              child: TextField(
                  controller: _controller,
                  onChanged: _onChanged,
                  autofocus: true,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  //输入文本的样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hint ?? '',
                    hintStyle: TextStyle(fontSize: 15),
                  ))),
          !showClear
              ? _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: Colors.grey,
                  ),
                  widget.speakClick)
              : _wrapTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ), () {
                  setState(() {
                    _controller.clear();
                  });
                  _onChanged('');
                })
        ],
      ),
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
}
