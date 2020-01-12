import 'dart:async';

import 'package:check_receipt/ui/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplahScreen extends StatefulWidget {
  @override
  _SplahScreenState createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Image.asset('assets/img/receipt.png', width: 70.0, height: 70.0,),
        ),
        SizedBox(height: 4.0,),
        Center(
          child: Text("Check Receipt"),
        )
      ],
    ));
  }
}
