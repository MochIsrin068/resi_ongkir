import 'package:check_receipt/bloc/chargeCodeBLoc.dart';
import 'package:check_receipt/model/data/dataReceipt.dart';
import 'package:check_receipt/ui/charge/detailChargeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChargeScreen extends StatelessWidget {
  final TextEditingController textCodeOrigin = TextEditingController();
  final TextEditingController textCodeDestination = TextEditingController();
  final TextEditingController weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChargeCodeBloc chargeCodeBloc = BlocProvider.of<ChargeCodeBloc>(context);
    return ListView(
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black54,
                                  width: 2,
                                  style: BorderStyle.solid))),
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Text("Cek Harga Ongkir",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 16.0),
                    Text("Cek ongkir barangmu sekarang juga!",
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(height: 4.0),
                    Text("dari kota asal sampai kota tujuan",
                        style: TextStyle(fontSize: 14.0))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/img/receipt.png",
                    height: 90.0, width: 90.0),
              ),
            ],
          ),
        ),
        Divider(),
        SizedBox(
          height: 20.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textCodeOrigin,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city, size: 18.0),
                        border: InputBorder.none,
                        hintText: "Kode kecamatan asal..."),
                  ),
                ),
              ),
              Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textCodeDestination,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city, size: 18.0),
                        border: InputBorder.none,
                        hintText: "Kode kecamatan tujuan..."),
                  ),
                ),
              ),
              Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: weight,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.local_grocery_store, size: 18.0),
                        border: InputBorder.none,
                        hintText: "berat..."),
                  ),
                ),
              ),
              // SizedBox(height: 14.0),
              Card(
                color: Colors.grey[100],
                elevation: 1.0,
                child: Container(
                    padding: EdgeInsets.all(6.0),
                    child: BlocBuilder(
                      bloc: chargeCodeBloc,
                      builder: (context, snap) {
                        return Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Icon(Icons.receipt,
                                size: 18.0, color: Colors.black54),
                            SizedBox(
                              width: 14.0,
                            ),
                            DropdownButton(
                              style: TextStyle(color: Colors.black54),
                              underline: Container(),
                              icon: Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width -
                                          200),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  )),
                              value: snap,
                              onChanged: (newValue) {
                                print(newValue);
                                chargeCodeBloc.valueOption = newValue;
                                print(chargeCodeBloc.valueOption);
                                chargeCodeBloc.add(newValue);
                              },
                              items: codeReceipt.map((String v) {
                                return DropdownMenuItem(
                                  value: v,
                                  child: Text(v.toUpperCase()),
                                );
                              }).toList(),
                            )
                          ],
                        );
                      },
                    )),
              ),
              SizedBox(height: 38.0),
              Container(
                  padding: EdgeInsets.only(right: 6.0),
                  alignment: Alignment.topRight,
                  child: BlocBuilder<ChargeCodeBloc, String>(
                    builder: (context, snap) => MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailChargeScreen(
                                    courirCode: snap,
                                    origin: textCodeOrigin.text,
                                    destination: textCodeDestination.text,
                                    weight: weight.text,
                                  )));
                        },
                        color: Colors.pink[400],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Lihat",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 8.0),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            )
                          ],
                        )),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
