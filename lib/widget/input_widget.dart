import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum InputType { phone, code, password }

class Input extends StatefulWidget {
  final String hintText;
  final String labelText;

  final InputType inputType;
  Input({Key key, this.hintText, this.inputType, this.labelText});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController _controller = TextEditingController();
  bool showClear = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      controller: _controller,
      onChanged: _onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: ScreenUtil().setHeight(11), left: ScreenUtil().setWidth(40), right: 15),
        labelText: widget.labelText,
        /*labelStyle: TextStyle(fontSize: ScreenUtil().setSp(32),
            color: Color(0xff9d9165)),*/

        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: ScreenUtil().setSp(32),
            color: Color(0xff9d9165)),
        suffix: showClear
            ? _wrapTap(
                Icon(Icons.cancel,
                    color: Theme.of(context).primaryColor, size: 20), () {
                  setState(() {
                    _controller.clear();
                  });
                _onChanged('');
              })
            : null,
      ),
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

  }
  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }
}
