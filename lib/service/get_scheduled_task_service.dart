import 'dart:convert';

import 'package:http/http.dart';
import 'package:villa_galetta_flutter/endpoint/endpoint.dart';
import 'package:villa_galetta_flutter/endpoint/server_config.dart';
import 'package:villa_galetta_flutter/response/get_scheduled_task.dart';

class GetScheduledTaskService {
  Future<GetScheduledTask> getScheduledTask() async {
    String url = EndpointParameters().getScheduledTask();

    Response response = await get(url, headers: ServerConfig().authHeaders);

    if (response.statusCode == 200) {
      return GetScheduledTask(json.decode(response.body));
    } else {
      throw Exception('Impossibile recuperare lo stato dell\' impianto');
    }
  }
}
