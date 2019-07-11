import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nvshu/widget/search_bar.dart';
import 'package:path/path.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _pressed = false;
  AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    String text="";
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
            child: SearchBar(
              type: SearchBarType.normal,
              leftButtonClick: () {},
              onChanged: (value) {
                setState(() {
                  text=value;
                });
              },
            ),
          ),
          Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(32),
                    right: ScreenUtil().setWidth(32)),
                child: Row(
                  children: <Widget>[
                    Text('标注发音'),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('发音练习'),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(121), fontFamily: "nvshu"),
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/icon/sound.png',
                      width: ScreenUtil().setWidth(31),
                      height: ScreenUtil().setWidth(31),
                    ),
                    onTap: play,
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAudioPlayer();
  }

  void play() async {
    if (!this._pressed) {
      setState(() {
        this._pressed = true;
      });
      //发音
      int result =
          await _audioPlayer.play("http://file.huanxi.life:86/upload/p.m4a");
      Timer(Duration(seconds: 1), () {
        setState(() {
          this._pressed = false;
        });
      });
    }
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    super.dispose();
  }
}
