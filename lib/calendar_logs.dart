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
    // Add the log to the dayLogs map
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

    // Update the budget if the log type is Profit or Loss
    if (type == "Profit" || type == "Loss") {
      BudgetService.updateBudget(Log(
        date: date,
        type: type,
        description: description,
        amount: amount,
      ));
    }
  }

  static List<Log>? getLogsForDay(DateTime date) {
    return dayLogs[date];
  }

  // Method to delete a log by date and description
  static void deleteLog(DateTime date, String type, String description) {
    if (dayLogs.containsKey(date)) {
      dayLogs[date]?.removeWhere((log) => log.type == type && log.description == description);
      
      // If no logs are left for the given date, remove the entry entirely
      if (dayLogs[date]?.isEmpty ?? true) {
        dayLogs.remove(date);
      }

      // After deletion, we need to update the budget again since a log was deleted
      _recalculateBudget();
    }
  }

  // Recalculate the budget based on the current logs (in case of deletion)
  static void _recalculateBudget() {
    BudgetService.resetBudget(); // Reset the budget
    // Loop through all logs and update the budget accordingly
    dayLogs.forEach((date, logs) {
      for (var log in logs) {
        if (log.type == "Profit" || log.type == "Loss") {
          BudgetService.updateBudget(log);
        }
      }
    });
  }
}


class BudgetService {
  static double currentBudget = 0.0; // Store the current budget

  // Method to update the budget based on the type of log (profit or loss)
  static void updateBudget(Log log) {
    if (log.type == "Profit") {
      currentBudget += log.amount;  // Increase the budget for profit logs
    } else if (log.type == "Loss") {
      currentBudget -= log.amount;  // Decrease the budget for loss logs
    }
  }

  // Method to get the current budget
  static double getCurrentBudget() {
    return currentBudget;
  }

  static void resetBudget() {
    currentBudget = 0.0;
  }
}