import 'package:flutter/material.dart';
import 'package:nvshu/pages/login_page.dart';
import 'package:nvshu/pages/search_page.dart';

import 'config.dart';
import 'navigator/tab_navigator.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '掌上女书',
      theme: ThemeData(
          primaryColor: GlobalConfig.color,
          accentColor: GlobalConfig.color,
      textTheme: TextTheme(
        display1: TextStyle(color: GlobalConfig.color),
      )),
      home: TabNavigator(),
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => LoginPage(),
        'search':(BuildContext context) => SearchPage()
      },
    );
  }
}
