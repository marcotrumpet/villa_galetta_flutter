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