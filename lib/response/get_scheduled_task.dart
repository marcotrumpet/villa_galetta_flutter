import 'package:villa_galetta_flutter/response/esito_response.dart';

class GetScheduledTask extends EsitoResponse {
  GetScheduledTask(Map<String, dynamic> map) : super(map) {
    if (!map['esito']) {
      return;
    }
  }
}
