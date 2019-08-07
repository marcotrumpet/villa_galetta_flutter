import 'package:villa_galetta_flutter/response/esito_response.dart';
import 'package:villa_galetta_flutter/response/get_current_task_giardino.dart';

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