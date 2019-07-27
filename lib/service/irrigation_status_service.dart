import 'dart:convert';

import 'package:http/http.dart';
import 'package:villa_galetta_flutter/endpoint/endpoint.dart';

class IrrigationStatusService {
  Future<Get> getStatus() async {
    String url = EndpointParameters().getStatusUrl();
    Response response = await get(url);

    if (response.statusCode == 200) {
      return Get.fromJson(json.decode(response.body));
    } else {
      throw Exception('Impossibile recuperare lo stato dell\' impianto');
    }
  }
}

class Get {
  final bool status;

  Get({this.status});

  factory Get.fromJson(Map<String, dynamic> json) {
    return Get(
      status: json['data']['status'],
    );
  }
}
