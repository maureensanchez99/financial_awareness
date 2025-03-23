import 'package:flutter/material.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(163, 154, 172, 1),
      ),
      body: Container(  
        color: const Color.fromRGBO(163, 154, 172, 1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,  
                children: [
                  const Text(
                    'Enter new scholarship info:',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField( // First text field
                    decoration: const InputDecoration(
                      hintText: 'Scholarship Organization',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter organization scholarship is from';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField( // Second text field
                    decoration: const InputDecoration(
                      hintText: 'Scholarship Amount',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the scholarship value';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField( // Third text field
                    decoration: const InputDecoration(
                      hintText: 'Scholarship Organization Link',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter organization site link scholarship is from';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton( // Submit button
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(241, 238, 219,1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Submit',
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
        ),
      ),
    );
  }
}