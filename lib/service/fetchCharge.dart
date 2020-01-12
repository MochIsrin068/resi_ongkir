import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchCharge(String originCode, String destinationCode, String weight,
    String courierCode) async {
  var res = await http.post("https://ongkir.matik.id/cost", body: {
    "subdistrictIdOrigin": originCode,
    "subdistrictIdDestination": destinationCode,
    "weightGram": weight,
    "courierCode": courierCode
  });

  var jsonData = json.decode(res.body);

  return jsonData;
}
