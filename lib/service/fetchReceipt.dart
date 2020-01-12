import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchReceipt(String waybil, String courirCode) async{
  var res = await http.post("https://ongkir.matik.id/waybill", body: {
    'waybill' : waybil,
    'courierCode' : courirCode
  });

  var jsonData = json.decode(res.body);
  return jsonData;
}