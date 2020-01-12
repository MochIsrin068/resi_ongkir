import 'package:flutter/material.dart';

class TimeLineModelCard extends StatelessWidget {
  final String manifestDescription, cityName, manifestDate, manifestTime;

  TimeLineModelCard(
      {this.manifestDescription,
      this.manifestDate,
      this.manifestTime,
      this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      margin: EdgeInsets.only(bottom: 20.0),
      color: Colors.amber,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(manifestDescription, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
          SizedBox(height: 6.0,),
          Text(cityName, style: TextStyle(color: Colors.white)),
          Text(manifestDate, style: TextStyle(color: Colors.white)),
          Text(manifestTime, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
