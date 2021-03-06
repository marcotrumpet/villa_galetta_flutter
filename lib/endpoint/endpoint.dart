import 'package:villa_galetta_flutter/endpoint/server_config.dart';

class Endpoint {
  static const STATUS = "status";
  static const ALWAYS_ONOFF = "always/";
  //Accende a tempo indefinito l'irrigazione
  static const ON_MINUTES = "on/";
  //Accende per un tempo di MINUTES l'irrigazione
  static const SCHEDULE_CRONTAB = "schedule";
  //Lista tutti i comandi schedulati in crontab
  static const SCHEDULE_DAILY = "schedule/daily?";
  //Programma l'accensione del giardino per MINUTI a partire da hh:mm tutti i giorni
  static const REMOVE_SCHEDULE = "schedule/remove?guid=";
  //Rimuove una programmazione dal crontab del task con GUID fornito
}

class EndpointParameters {
  String getStatusUrl() {
    return ServerConfig.BASIC_URL + Endpoint.STATUS;
  }

  String getAlwaysOnOffUrl(String onOff) {
    return ServerConfig.BASIC_URL + Endpoint.ALWAYS_ONOFF + onOff;
  }

  String getOnForMinutesUrl(int minutes) {
    return ServerConfig.BASIC_URL + Endpoint.ON_MINUTES + minutes.toString();
  }

  String getScheduledTask() {
    return ServerConfig.BASIC_URL + Endpoint.SCHEDULE_CRONTAB;
  }

  String setScheduledDaily(int minutes, int hour, int minute) {
    return ServerConfig.BASIC_URL +
        Endpoint.SCHEDULE_DAILY +
        'duration=${minutes.toString()}&startTime=$hour:$minute';
  }

  String setRemoveScheduledTask(String guid) {
    return ServerConfig.BASIC_URL + Endpoint.REMOVE_SCHEDULE + guid;
  }
}
