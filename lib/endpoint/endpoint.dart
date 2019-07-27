class Endpoint {
  static const BASIC_URL = "http://192.168.178.7:8080/giardino/";
  static const STATUS = "status";
  static const ALWAYS_ON = "always/on";
  //Accende a tempo indefinito l'irrigazione
  static const ALWAYS_OFF = "always/off";
  //Spegne a tempo indefinito l'irrigazione
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
    return Endpoint.BASIC_URL + Endpoint.STATUS;
  }

  String getAlwaysOnUrl() {
    return Endpoint.BASIC_URL + Endpoint.ALWAYS_ON;
  }

  String getAlwaysOffUrl() {
    return Endpoint.BASIC_URL + Endpoint.ALWAYS_OFF;
  }

  String getOnForMinutesUrl(int minutes) {
    return Endpoint.BASIC_URL + Endpoint.ON_MINUTES + minutes.toString();
  }

  String getScheduledTask() {
    return Endpoint.BASIC_URL + Endpoint.SCHEDULE_CRONTAB;
  }

  String setScheduledDaily(int minutes, DateTime time) {
    return Endpoint.BASIC_URL +
        Endpoint.SCHEDULE_DAILY +
        'duration=${minutes.toString()}&startTime=${time.hour}:${time.minute}';
  }

  String setRemoveScheduledTask(String guid) {
    return Endpoint.BASIC_URL + Endpoint.REMOVE_SCHEDULE + guid;
  }
}
