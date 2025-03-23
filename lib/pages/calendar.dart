import 'package:flutter/material.dart';
import 'package:financial_awareness/calendar_logs.dart';  // Import the Log and LogService classes

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class Months
  {
    final String name;
    final int days;

    Months({required this.name, required this.days});
  }
class _CalendarState extends State<Calendar> {
  final List<Months> months = [
    Months(name: "January", days: 31),
    Months(name: "February", days: 28),
    Months(name: "March", days: 31),
    Months(name: "April", days: 30),
    Months(name: "May", days: 31),
    Months(name: "June", days: 30),
    Months(name: "July", days: 31),
    Months(name: "August", days: 31),
    Months(name: "September", days: 30),
    Months(name: "October", days: 31),
    Months(name: "November", days: 30),
    Months(name: "December", days: 31),
  ];

  String selectedLogType = 'Profit';

  DateTime today = DateTime.now();
  int monthIndex = DateTime.now().month - 1;
  int currentYear = DateTime.now().year;
  int year = DateTime.now().year;

  DateTime selectedDate = DateTime.now(); // Track the selected date
  final TextEditingController logDescriptionController = TextEditingController();
  final TextEditingController logAmountController = TextEditingController();
  final TextEditingController logTypeController = TextEditingController();

  // Method to add a new log
  void addLogForSelectedDate() {
    String description = logDescriptionController.text;
    double amount = double.tryParse(logAmountController.text) ?? 0.0;
    String type = logTypeController.text;

    if (description.isNotEmpty || type.isNotEmpty) {
      LogService.addLog(selectedDate, type, description, amount: amount);
      setState(() {}); // Refresh the UI to show the new log
    }
  }

  int getDays() {
    int days = months[monthIndex].days;
    if (monthIndex == 1 && year % 4 == 0) {
      return days + 1;
    }
    return days;
  }

  int getMonthStartDay() {
    DateTime startDay = DateTime(year, monthIndex + 1, 1);
    return startDay.weekday % 7;
  }

  // Display the logs for the selected date
 Widget buildLogsSection(DateTime date) {
  List<Log>? logsForDay = LogService.getLogsForDay(date);
  if (logsForDay == null || logsForDay.isEmpty) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("No logs available for this day.", style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  } else {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: logsForDay.length,
      itemBuilder: (context, index) {
        final log = logsForDay[index];
        return Card(  // Optional: You can wrap it with Card for better visual appearance
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            title: Text("${log.type}: ${log.description}"),
            subtitle: Text("Amount: \$${log.amount}"),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  // Delete the log when the delete button is pressed
                  LogService.deleteLog(date, log.type, log.description);
                });
              },
            ),
          ),
        );
      },
    );
  }
}

  // Method to open the bottom sheet
  void openAddLogBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Log for ${selectedDate.month}/${selectedDate.day}/${selectedDate.year}"),
              DropdownButton<String>(
              value: selectedLogType, // the currently selected log type
              onChanged: (String? newValue) {
                setState(() {
                selectedLogType = newValue!; // Update the selected log type
              });
              },
              items: <String>['Profit', 'Loss', 'FASFA', 'Scholarship'] // predefined options
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
        }).toList(),
        hint: Text('Select Log Type'), // Display hint when no selection is made
        isExpanded: true, // Ensures dropdown takes full width
      ),
              TextField(
                controller: logDescriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: logAmountController,
                decoration: InputDecoration(labelText: "Amount (optional)"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  addLogForSelectedDate();
                  Navigator.pop(context); // Close the bottom sheet after adding the log
                },
                child: Text("Add Log"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Calendar')),
    body: Column(
      children: [
        // Calendar Header and Navigation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (monthIndex == 0) {
                    year -= 1;
                    monthIndex = 11;
                  } else {
                    monthIndex -= 1;
                  }
                });
              },
              child: Icon(Icons.arrow_left),
            ),
            Text("${months[monthIndex].name} $year"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (monthIndex == 11) {
                    year += 1;
                    monthIndex = 0;
                  } else {
                    monthIndex += 1;
                  }
                });
              },
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),

  
        Text("Current Date: ${months[today.month - 1].name}, ${today.day}, $currentYear"),

        SizedBox(
          width: double.infinity,
          height: 25,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 7,
            children: [
              Text("Sun"),
              Text("Mon"),
              Text("Tue"),
              Text("Wed"),
              Text("Thu"),
              Text("Fri"),
              Text("Sat"),
            ],
          ),
        ),

        // Days of the Calendar
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 7,
            childAspectRatio: 1 / 2,
            children: List.generate(getMonthStartDay() + getDays(), (index) {
              if (index < getMonthStartDay()) {
                return Container();
              } else {
                DateTime currentDate = DateTime(year, monthIndex + 1, index - getMonthStartDay() + 1);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = currentDate; // Update the selected date
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[((index - getMonthStartDay()) % 9) * 100],
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '${index - getMonthStartDay() + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          if (LogService.getLogsForDay(currentDate)?.isNotEmpty == true)
                            Icon(Icons.event, color: Colors.white, size: 16), // Indicator for logs
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
          ),
        ),

        // Display the selected date and its logs
        Text("${months[monthIndex].name} ${selectedDate.day}, ${selectedDate.year}"),

        // Display the logs for the selected date
        Expanded(
          child: buildLogsSection(selectedDate),  // This will ensure the list scrolls independently
        ),
      ],
    ),

    // Floating Action Button to open the bottom sheet
    floatingActionButton: Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: openAddLogBottomSheet,
        child: Icon(Icons.add),
      ),
    ),
  );
}
}
