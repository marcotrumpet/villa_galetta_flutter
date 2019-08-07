import 'package:villa_galetta_flutter/response/esito_response.dart';

class IrrigationOn extends EsitoResponse {
  bool irrigationOn;

  IrrigationOn(Map<String, dynamic> map) : super(map) {
    if (!map['esito']) {
      return;
    } else {
      irrigationOn = map['esito'];
    }
  }
}
