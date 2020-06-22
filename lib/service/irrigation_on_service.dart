import 'dart:convert';

import 'package:http/http.dart';
import 'package:villa_galetta_flutter/endpoint/endpoint.dart';
import 'package:villa_galetta_flutter/endpoint/server_config.dart';
import 'package:villa_galetta_flutter/response/irrigation_on.dart';

class IrrigationOnService {
  Future<IrrigationOn> irrigationOn(String onOff) async {
    String url = EndpointParameters().getAlwaysOnOffUrl(onOff);

    Response response = await get(url, headers: ServerConfig().authHeaders);

    if (response.statusCode == 200) {
      return IrrigationOn(json.decode(response.body));
    } else {
      throw Exception('Impossibile recuperare lo stato dell\' impianto');
    }
  }
}
