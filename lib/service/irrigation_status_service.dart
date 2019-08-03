import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:villa_galetta_flutter/endpoint/endpoint.dart';

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

abstract class EsitoResponse {
  bool esito;

  @mustCallSuper
  EsitoResponse(Map<String, dynamic> body) {
    esito = body['esito'];
  }
}

class GetStatusGiardino extends EsitoResponse {
  bool statusGiardino;
  GetCurrentTaskGiardino taskGiardinoDetail;

  GetStatusGiardino(Map<String, dynamic> map) : super(map) {
    if (!map['esito']) {
      return;
    }
    statusGiardino = map['data']['statusGiardino'];
    taskGiardinoDetail = map['data']['currentTask'] != null
        ? GetCurrentTaskGiardino(map['data'])
        : null;
  }
}

class GetCurrentTaskGiardino {
  int duration;
  String taskDate;
  int percentage;

  GetCurrentTaskGiardino(Map<String, dynamic> map) {
    duration = map['currentTask']['duration'] ?? null;
    taskDate = map['currentTask']['taskDate'] ?? null;
    percentage = map['currentTask']['percentage'] ?? null;
  }
}
