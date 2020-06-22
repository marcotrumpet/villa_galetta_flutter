import 'dart:convert';

import 'package:http/http.dart';
import 'package:villa_galetta_flutter/endpoint/endpoint.dart';
import 'package:villa_galetta_flutter/endpoint/server_config.dart';
import 'package:villa_galetta_flutter/response/irrigation_on_minutes.dart';

class IrrigationOnMinutes {
  Future<IrrigationOnMiunutes> onForMinutes(int minutes) async {
    String url = EndpointParameters().getOnForMinutesUrl(minutes);

    Response response = await get(url, headers: ServerConfig().authHeaders);

    if (response.statusCode == 200) {
      return IrrigationOnMiunutes(json.decode(response.body));
    } else {
      throw Exception('Impossibile recuperare lo stato dell\' impianto');
    }
  }
}
