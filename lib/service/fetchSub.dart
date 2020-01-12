import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchSub(String city) async{
  var res =  await http.get("https://ongkir.matik.id/city?city_id=$city");
  var jsonData = json.decode(res.body);

  return jsonData["results"];
}