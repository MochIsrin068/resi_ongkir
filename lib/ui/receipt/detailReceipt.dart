import 'package:check_receipt/service/fetchReceipt.dart';
import 'package:check_receipt/ui/receipt/detailReceiptCard.dart';
import 'package:flutter/material.dart';

class DetailReceipt extends StatelessWidget {
  final String waybill, courirCode;

  DetailReceipt({this.waybill, this.courirCode});

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
        title: Text("Detail Receipt", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: fetchReceipt(waybill, courirCode),
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
                          SizedBox(height: 100.0,)
                        ],
                      ));
                } else {
                  return Container(
                      child: DetailReceiptCard(results: snap.data['results']));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
