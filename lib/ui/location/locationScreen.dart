import 'package:check_receipt/bloc/chargeCodeBLoc.dart';
import 'package:check_receipt/bloc/cityBloc.dart';
import 'package:check_receipt/bloc/provinceBloc.dart';
import 'package:check_receipt/bloc/resultsCodeSub.dart';
import 'package:check_receipt/bloc/subBloc.dart';
import 'package:check_receipt/service/fetchCity.dart';
import 'package:check_receipt/service/fetchProvince.dart';
import 'package:check_receipt/service/fetchSub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProvinceBloc provinceBloc = BlocProvider.of<ProvinceBloc>(context);
    CityBloc cityBloc = BlocProvider.of<CityBloc>(context);
    SubBloc subBloc = BlocProvider.of<SubBloc>(context);
    ResultCodeSub resultCodeSub = BlocProvider.of<ResultCodeSub>(context);
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
                      child: Text("Cek Kode Kecamatan",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 16.0),
                    Text("Cek kode kecamatan anda!",
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(height: 4.0),
                    Text("untuk mengetahui harga ongkir",
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
              SizedBox(height: 14.0),
              FutureBuilder(
                future: fetchProvince(),
                builder: (context, snap) {
                  return snap.hasData
                      ? Card(
                          color: Colors.grey[100],
                          elevation: 1.0,
                          child: Container(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20.0,
                                ),
                                Icon(Icons.receipt,
                                    size: 18.0, color: Colors.black54),
                                SizedBox(
                                  width: 14.0,
                                ),
                                BlocBuilder<ProvinceBloc, String>(
                                  bloc: provinceBloc,
                                  builder: (context, snapshots) {
                                    return DropdownButton(
                                      style: TextStyle(color: Colors.black54),
                                      underline: Container(),
                                      icon: Container(
                                          margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  200),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          )),
                                      value: snapshots,
                                      onChanged: (newValue) {
                                        // print(newValue);
                                        // chargeCodeBloc.valueOption = newValue;
                                        // print(chargeCodeBloc.valueOption);
                                        provinceBloc.add(newValue);
                                      },
                                      items: snap.data.map((objectdata) {
                                        return DropdownMenuItem(
                                          value: objectdata["province_id"],
                                          child: Text(objectdata["province"]
                                              .toUpperCase()),
                                        );
                                      }).toList(),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      : Center(child: Text("Loading....."));
                },
              ),
              BlocBuilder<ProvinceBloc, String>(
                bloc: provinceBloc,
                builder: (context, snps) {
                  return FutureBuilder(
                    future: fetchCity(snps),
                    builder: (context, s) {
                      return s.hasData
                          ? Card(
                              color: Colors.grey[100],
                              elevation: 1.0,
                              child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Icon(Icons.receipt,
                                          size: 18.0, color: Colors.black54),
                                      SizedBox(
                                        width: 14.0,
                                      ),
                                      BlocBuilder<CityBloc, String>(
                                        bloc: cityBloc,
                                        builder: (context, ss) {
                                          return DropdownButton(
                                            style: TextStyle(
                                                color: Colors.black54),
                                            underline: Container(),
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        200),
                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                )),
                                            value: ss,
                                            onChanged: (newValue) {
                                              // print(newValue);
                                              // chargeCodeBloc.valueOption = newValue;
                                              // print(chargeCodeBloc.valueOption);
                                              cityBloc.add(newValue);
                                            },
                                            items: s.data.map((objectdata) {
                                              return DropdownMenuItem(
                                                value: objectdata["city_id"],
                                                child: Text(
                                                    objectdata["city_name"]
                                                        .toUpperCase()),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      )
                                    ],
                                  )),
                            )
                          : Center(child: Text("Loading....."));
                    },
                  );
                },
              ),
              BlocBuilder<CityBloc, String>(
                bloc: cityBloc,
                builder: (context, snps) {
                  return FutureBuilder(
                    future: fetchSub(snps),
                    builder: (context, s) {
                      return s.hasData
                          ? Card(
                              color: Colors.grey[100],
                              elevation: 1.0,
                              child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Icon(Icons.receipt,
                                          size: 18.0, color: Colors.black54),
                                      SizedBox(
                                        width: 14.0,
                                      ),
                                      BlocBuilder<SubBloc, String>(
                                        bloc: subBloc,
                                        builder: (context, ss) {
                                          return DropdownButton(
                                            style: TextStyle(
                                                color: Colors.black54),
                                            underline: Container(),
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        200),
                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                )),
                                            value: ss,
                                            onChanged: (newValue) {
                                              // print(newValue);
                                              // chargeCodeBloc.valueOption = newValue;
                                              // print(chargeCodeBloc.valueOption);
                                              provinceBloc.add(newValue);
                                            },
                                            items: s.data.map((objectdata) {
                                              return DropdownMenuItem(
                                                value: objectdata[
                                                    "subdistrict_id"],
                                                child: Text(objectdata[
                                                        "subdistrict_name"]
                                                    .toUpperCase()),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      )
                                    ],
                                  )),
                            )
                          : Center(child: Text("Loading....."));
                    },
                  );
                },
              ),
              SizedBox(height: 38.0),
              Container(
                  padding: EdgeInsets.only(right: 6.0),
                  alignment: Alignment.topRight,
                  child: BlocBuilder<ChargeCodeBloc, String>(
                    builder: (context, snap) => MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {},
                        color: Colors.pink[400],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Cari",
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
              BlocBuilder(
                bloc: resultCodeSub,
                builder: (context, snap) {
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.grey[200],
                      child: Text(
                        snap,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ));
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
