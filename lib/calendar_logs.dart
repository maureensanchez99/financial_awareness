import 'package:flutter/material.dart';


class Log{
  final DateTime date;
  final String type;
  final String description;
  final double amount;

  Log({
    required this.date,
    required this.type,
    required this.description,
    this.amount = 0.0
  });

}

class LogService {
  static Map<DateTime, List<Log>> dayLogs = {};


   static void addLog(DateTime date, String type, String description, {double amount = 0.0, String additionalInfo = ''}) {
    if (dayLogs.containsKey(date)) {
      dayLogs[date]?.add(Log(
        date: date,
        type: type,
        description: description,
        amount: amount,
      ));
    } else {
      dayLogs[date] = [
        Log(
          date: date,
          type: type,
          description: description,
          amount: amount,
        ),
      ];
    }
  }

  // Method to show the logs for a specific date
  static List<Log>? getLogsForDay(DateTime date) {
    return dayLogs[date];
  }
}