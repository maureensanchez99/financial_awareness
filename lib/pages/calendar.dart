import 'package:flutter/material.dart';

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

    DateTime today = DateTime.now();
    int monthIndex = DateTime.now().month - 1;
    int year = DateTime.now().year;



  void changeMonthLeft()
  {
    setState(() {
      if (monthIndex == 0)
      {
        reduceYear();
        monthIndex = 11;

      }
      else
      {
        monthIndex -= 1;
      }
    });
   
  }

  void changeMonthRight()
  {
     setState(() {
      if (monthIndex == 11)
      {
        increaseYear();
        monthIndex = 0;
      }
      else
      {
        monthIndex += 1;
      }
    });
  }

  void reduceYear()
  {
    setState(() {
      year -= 1;
    });
  }

  void increaseYear()
  {
    setState(() {
      year += 1;
    });
  }
  
  int getDays()
  {
    int days = months[monthIndex].days;
    if (monthIndex == 1 && year%4 == 0)
    {
      return days + 1;
    }
    return days;
  }

  int getMonthStartDay()
  {
    DateTime startDay = DateTime(year, monthIndex + 1, 1);
    return startDay.weekday % 7;

  }

  void getDate(int i)
  {
    setState(() {
      today = DateTime(year,monthIndex + 1, i);
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(
                onPressed: changeMonthLeft,
                child: Icon(Icons.arrow_left)
              ),
              Text("${months[monthIndex].name} $year"),
              ElevatedButton(
                onPressed: changeMonthRight, 
                child: Icon(Icons.arrow_right))
              ],
            ),
            // Row with days of the week
            SizedBox(
              width: double.infinity,
              height: 25,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 7,  // 7 columns for the days of the week 
                children: [
                Text("Sun"),
                Text("Mon"),
                Text("Tues"),
                Text("Wed"),
                Text("Thurs"),
                Text("Fri"),
                Text("Sat"),
                ], // Increase height of each box
                ),
            ),
             
            // Expanded GridView
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 7,  // 7 columns for the days of the week
                childAspectRatio: 1 / 2,  // Increase height of each box
                children: List.generate(getMonthStartDay() + getDays(), (index) {  // Generate 28 days (4 rows * 7 columns)
                  if (index < getMonthStartDay())
                  {
                    return Container();
                  }
                  else
                  {
                    return GestureDetector(
                      onTap: () {
                        getDate(index - getMonthStartDay() + 1);
                      }
                    ,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[((index - getMonthStartDay()) % 9) * 100],  // Varying color for each box
                    child: Center(
                      child:  Column(
                        children: [
                          Text
                          (
                            '${index - getMonthStartDay()+ 1}',  // Day numbers (1 to 28)
                             style: const TextStyle(color: Colors.white), 
                          ),
                        ],
                      )
                    ),
                  )
                  );
                  }
                }),
              ),
            ),
            Text("Date: ${today.weekday + 1}"),
          ], //children
        ),
      ),
    );
  }
}
