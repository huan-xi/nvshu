import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(100),
            child: RaisedButton(
              child: Text("登入/注册"),
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
