import 'package:flutter/material.dart';
import 'new_entry.dart';

class Scholarships extends StatelessWidget {
  Scholarships({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(163, 154, 172, 1),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Container( //page title
                width: double.infinity,
                height: 80,
                alignment: Alignment.center,
                child: const Text(
                  "My Scholarships",
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewEntry()),
                    );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(241, 238, 219,1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  'Enter new scholarship',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(60, 16, 83, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
