import 'package:flutter/material.dart';
import 'new_entry.dart';

class Scholarships extends StatelessWidget {
  Scholarships({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Enter new scholarship'),
            ),
          ],
        ),
      ),
    );
  }
}
