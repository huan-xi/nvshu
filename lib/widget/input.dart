import 'package:flutter/material.dart';

enum InputType { phone, code, password }

class Input extends StatefulWidget {
  final String hintText;
  final InputType inputType;

  Input({Key key, this.hintText, this.inputType});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  static  Color primaryColor;
  @override
  Widget build(BuildContext context) {
    primaryColor=Theme.of(context).primaryColor;
    return Container(margin: EdgeInsets.all(40), child: _input());
  }

  _input() {
    if (widget.inputType == InputType.phone) {
      return TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone_iphone),
            hintText: widget.hintText,
            hintStyle: _hintStyle()),
      );
    }else if(widget.inputType==InputType.code){
      return TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: widget.hintText,
            hintStyle: _hintStyle(),
            suffixIcon: _button()
        ),
      );
    }
  }

  _hintStyle() {
      return   TextStyle(fontSize: 20);
  }

  _button() {
    return Container(
      alignment: FractionalOffset.centerLeft,
      width: 100,
      decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(child: Text("获取验证码",style: TextStyle(fontSize: 15),),),
    );
  }
}
