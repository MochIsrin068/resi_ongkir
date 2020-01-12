import 'package:check_receipt/ui/charge/chargeScreen.dart';
import 'package:check_receipt/ui/location/locationScreen.dart';
import 'package:check_receipt/ui/receipt/receiptScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            ReceiptScreen(),
            ChargeScreen(),
            LocationScreen(),
          ],
        )
      ),
      bottomNavigationBar: Material(
        elevation: 10.0,
        child: TabBar(
          labelColor: Colors.blueAccent,
          controller: tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.receipt), text: "Cek Resi",),
            Tab(icon: Icon(Icons.account_balance_wallet), text: "Cek Ongkir",),
            Tab(icon: Icon(Icons.location_city), text: "cek kode kecamatan"),
          ],
        ),
      ),
    );
  }
}