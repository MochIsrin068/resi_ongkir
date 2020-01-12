import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchProvince() async{
  var res =  await http.get("https://ongkir.matik.id/province");
  var jsonData = json.decode(res.body);

  return jsonData["results"];
}