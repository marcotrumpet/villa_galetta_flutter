import 'package:flutter/foundation.dart';

abstract class EsitoResponse {
  bool esito;

  @mustCallSuper
  EsitoResponse(Map<String, dynamic> body) {
    esito = body['esito'];
  }
}