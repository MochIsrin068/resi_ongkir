import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchCity(String province) async{
  var res =  await http.get("https://ongkir.matik.id/city?province_id=$province");
  var jsonData = json.decode(res.body);

  return jsonData["results"];
}