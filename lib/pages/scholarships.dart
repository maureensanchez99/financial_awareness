import 'package:flutter/material.dart';

class Scholarships extends StatelessWidget {
  const Scholarships({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scholarships')),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              child: const Text(
                "My Scholarships:",
                style: TextStyle(
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}