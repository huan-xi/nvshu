import 'package:flutter/material.dart';
import 'package:nvshu/widget/input_widget.dart';
import 'package:nvshu/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: SearchBar(
              type: SearchBarType.normal,
              leftButtonClick: () {},
            ),
          ),
          Container(
              child: Text(
            "天",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "nvshu"
            ),
          ))
        ],
      ),
    );
  }
}
