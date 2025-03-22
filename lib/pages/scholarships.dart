import 'package:flutter/material.dart';

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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField( // first text field
                      decoration: const InputDecoration(
                        hintText: 'Scholarship Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton( // submit button
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
