import 'package:villa_galetta_flutter/response/esito_response.dart';

class IrrigationOnMiunutes extends EsitoResponse {
  bool irrigationOn;

  IrrigationOnMiunutes(Map<String, dynamic> map) : super(map) {
    if (!map['esito']) {
      return;
    } else {
      irrigationOn = map['esito'];
    }
  }
}
