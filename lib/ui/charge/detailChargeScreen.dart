import 'package:check_receipt/service/fetchCharge.dart';
import 'package:flutter/material.dart';

class DetailChargeScreen extends StatelessWidget {
  final String origin, destination, weight, courirCode;

  DetailChargeScreen(
      {this.origin, this.destination, this.weight, this.courirCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Detail Ongkir", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: fetchCharge(origin, destination, weight, courirCode),
            builder: (context, snap) {
              if (snap.hasData) {
                if (snap.data['results'] == null) {
                  return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/img/notfound.jpg",
                          ),
                          Text("Data Tidak Ditemukan!"),
                          SizedBox(
                            height: 100.0,
                          )
                        ],
                      ));
                } else {
                  return Container(
                      child: ListView(
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(6.0),
                                          width: 130.0,
                                          color: Colors.amber,
                                          height: 65.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  snap.data['results']
                                                      ["originDetails"]["city"],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              Text(
                                                snap.data['results']
                                                        ["originDetails"]
                                                    ["subdistrict_name"],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  snap.data['results']
                                                          ["destinationDetails"]
                                                      ["city"],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              Text(
                                                  snap.data['results']
                                                          ["destinationDetails"]
                                                      ["subdistrict_name"],
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              // Text(resi.receiverAddress1),
                                              // Text(resi.receiverAddress2),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              "${snap.data['results']["serviceDetails"]["name"]} ${snap.data['results']["serviceDetails"]["costs"][0]["description"]} : "),
                                          Text(
                                              "Rp. ${snap.data['results']["serviceDetails"]["costs"][0]["cost"][0]["value"]}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
