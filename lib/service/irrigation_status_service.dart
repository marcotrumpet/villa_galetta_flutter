import 'dart:convert';

import 'package:http/http.dart';
import 'package:villa_galetta_flutter/endpoint/endpoint.dart';
import 'package:villa_galetta_flutter/endpoint/server_config.dart';
import 'package:villa_galetta_flutter/response/get_status_giardino.dart';

class IrrigationStatusService {
  Future<GetStatusGiardino> getStatus() async {
    String url = EndpointParameters().getStatusUrl();

    Response response = await get(url, headers: ServerConfig().authHeaders);

    if (response.statusCode == 200) {
      return GetStatusGiardino(json.decode(response.body));
    } else {
      throw Exception('Impossibile recuperare lo stato dell\' impianto');
    }
  }
}
