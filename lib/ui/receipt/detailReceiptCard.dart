import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'TimeLineModelCard.dart';

class DetailReceiptCard extends StatelessWidget {
  final Map results;

  DetailReceiptCard({this.results});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Card(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(results['summary']['status'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(6.0),
                            width: 130.0,
                            color: Colors.amber,
                            height: 65.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(results['summary']['shipper_name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                Text(results['summary']['origin'], style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            width: 130.0,
                            height: 65.0,
                            color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(results['summary']['receiver_name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                Text(results['summary']['destination'], style: TextStyle(color: Colors.white)),
                                // Text(resi.receiverAddress1),
                                // Text(resi.receiverAddress2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          results['summary']['courier_code'] == "jne" ? Image.asset("assets/img/jne.png", width: 70.0, height: 70.0,) : (results['summary']['courier_code']),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text( results['details']['waybill_number'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: MediaQuery.of(context).size.height / 2,
          child: Timeline(
            position: TimelinePosition.Left,
            children: results['manifest']
                .map<TimelineModel>(
                  (manifest) => TimelineModel(
                      TimeLineModelCard(
                        cityName: manifest["city_name"],
                        manifestDate: manifest["manifest_date"],
                        manifestDescription: manifest["manifest_description"],
                        manifestTime: manifest["manifest_time"],
                      ),
                      position: TimelineItemPosition.left,
                      iconBackground: Colors.redAccent,
                      icon: Icon(Icons.blur_circular,  color: Colors.white,)),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
