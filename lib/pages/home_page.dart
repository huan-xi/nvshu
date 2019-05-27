import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
            child: RaisedButton(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("登入/注册"),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
          )
        ],
      ),
    );
  }
}
